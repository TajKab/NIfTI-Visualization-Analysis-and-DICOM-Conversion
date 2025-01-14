function fig_to_video(fig_file, output_video_name)
    open(fig_file);
    fig = gcf;
    ax = gca;

    video_writer = VideoWriter(output_video_name, 'MPEG-4');
    video_writer.FrameRate = 30;
    open(video_writer);

    for angle = 0:2:360
        view(ax, [angle, 30]);
        drawnow;
        frame = getframe(fig);
        writeVideo(video_writer, frame);
    end

    close(video_writer);
    close(fig);
    fprintf('Video saved as %s\n', output_video_name);
end