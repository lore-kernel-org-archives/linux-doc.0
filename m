Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177C350D46
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 19:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161053; cv=pass; b=DvebpBcrRQt/fnKw78ielfFI1dH/EVZHUuCipCtnh9GWH3bWKPJghRyfcl2Rv7AVhf/gzWECnQQMGnF7nXMmo+fBfdS9jOa9DAb2693Zrmu/Nn4UzI05eNPEcjaXUOEwOS2iOPU1GuNQK4eL4yX55TbR/w8WL0ywvDLXZbtbAWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161053; c=relaxed/simple;
	bh=4Rxaqcbxsoz2fcbOT7lRZNWfqn5zW6QshB87oNyAzGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzywspwvF9+oCuubMFlOjWLlWixl94r1LbkF4JdLf/w4zrDZZAbXoRmkCPFqxY3Dzcfo2YMWbWYLCwrQiMlrwKSU4MUZduoCvegLnvnS5m1dswaVbj4sgi/KTeK5S0Rr6RfNojoRejzal4cRhbEkhc6G4eQRqXz4GvijPZ/jojU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xeFlPogn; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xeFlPogn"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee243b98caso549931cf.1
        for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 11:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768161051; cv=none;
        d=google.com; s=arc-20240605;
        b=hM1W6lo7WNHD2i2HwB7TOxdPHSn0O4kQdJrlN1sdiDqUgAXkAB+CRZLJGBs15mt34t
         LiYkV6q5qAocxD3WypiSEvhD4j/4FarhONGJZGNB0HIZDN9TvOIAaa4wRbiNqPvNx2RB
         klVdUhDF2DcWChY5l0txYZAavNt5LcpE+nT/r2AyP78x2miylm9MvsCPe5RtKFZMRXov
         xoikMRZ+Q5yBwNo1XQlHz/zGkPGNIgyeFYOdBz4YeidlzYYhgTMPR+FHp9/kdQIhNtGu
         aDFU7APtwEX0W5DqIO2vmt6GXmfzTdBD1axZTx+4h8Jwh80U/wKcHkbbOxGS8bhwB/lz
         LV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Rxaqcbxsoz2fcbOT7lRZNWfqn5zW6QshB87oNyAzGY=;
        fh=EkIIcE8Lgxz3xiyYbBHgUy2IjjezkzyMmZ4+lI2bLPw=;
        b=BmgaVOYxYFO4oUQuMJspqHMJQy1DKehVPYSpYymwyapAw5odaxh78zX4n6HTSrUkXU
         BLKdqAl/DsKFdcJ0J7XG8UmI6oBrseDGFC5Clb9XbjxPsdYON77uTKUkBvlTeXY4gF25
         /pZw3Q+3Q1KDPyXAugNZ6nbGOhAgbfrImQthicgv/XCX7gZIqvNelp7DXkXHReHjgyse
         bkpqtYTP3wjcH7luKghgpbqDL6C/1kXUb3S95qA7sDbvHaYuUv8e/pfUILrIxIQE+Gq9
         nnQxaqha77pqGLg/QTrDZAX5sPmImuwfxGoOPU6bRJIVsp1yjRIqjr38s9VDNhm/iphC
         lViw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768161051; x=1768765851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Rxaqcbxsoz2fcbOT7lRZNWfqn5zW6QshB87oNyAzGY=;
        b=xeFlPognzcGQkI7TVEAnGY8DQRoXZqQIvqzzgK2rkHWdT4IwwT1c9DPa62yDWvnqGZ
         xRf8HVCF/D2U8rgJ5ygdzcTZFIOB+j0oeS7Lmm+yNO6kScS0whPyCnh2i2vzH+I3dN3D
         2JFW1rm869M444rhMB83cF4zUkVsLVc0O8IJR80R2XBiCg/RKR7xEHlc88Ef1iR8tSEm
         Usyjitvjk0kFVxQnfzz/9Yp1vJY9pyxmtcYQffrITgzxBrqbfnni7JAXD5jfqJppZQqb
         zovvKxrP7iC9E3P4Wml5xh8qDaB6+yCZpO57bla+DOBYp5kZcH1POa8nw8CPa1C382Bx
         XAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161051; x=1768765851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Rxaqcbxsoz2fcbOT7lRZNWfqn5zW6QshB87oNyAzGY=;
        b=lYJ+KZ3+2dMadRa/ss354G9BLKkEfGjS7P0/LfuJfKRIfkB+jdS5fKvj4ZW47p9PbA
         E9ObKzz2ejmcVpGmIMTuTn9LQDAipILfycMt/vR/ZQ5qzL9gwfSrfK2cNax72d93CQ2c
         PhZoNH2id+BL2MkSpyaUm0a+T4KSErmstrqR7UITMfQlF+tiiy4PKITSQ+Dc5tCSGy75
         b9u21YyvIhcjwKcWlEJQY9ah3Xi1R1lQvO2AzFYGmVUQuIrkdZpXMwcaZqhu+TbtfqzY
         Gxh4UsYW81Y2oUsfnKWYBgVBYjzE1/7Qo5W7nv5H8gN5iq8cyaEKpNdeYN6guvJuzg4+
         DrsA==
X-Forwarded-Encrypted: i=1; AJvYcCXJfEqwUcz8rvxxHqkGD335chi4dXQtn66VEj3HhNo8l1BJ5aLoCRSTp/VjL0LfGf6LK5jGkBI0mik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1kVOL7e2CA9RSl7K6jbkySZgLZo8nRCgVmIq8d4DhDYj0tGmq
	M7CV1dYzvJFJetU/VtvQXXeEWyR7fp1YpYf8H/ku2Zfkc6LRKNdkjbDnT8wwml1tNJRrrQ1VvWK
	krGFhE+R6JSOCxYIqU01k3Sinih8dsA+hJYavB4f2
X-Gm-Gg: AY/fxX6qrquD5Gc9bcqD5EUFCUESd79F6qv7zLcqKf2Ax8juA1OwzXTBlK5img7WFt2
	76VsVnV54K//hY4b3Qgku9EkzMTeFTxKj+2kpFMBbEPPOciLpzCCX+TJpPFQ+MeLE2W8C38JShF
	osteF4ESRneIn//FkQVreBMLUbeXKSb7g5CigtMWeWfJDWNkDYVbDvt2L9iBVNOmH7EA+oZVCuw
	pgmVOi8tHs+6Y00bbn1sKCMY0VPxd8CbrMPvCUUVG8C565GbbsdOOCT9+YhVmBLV/8WkQ==
X-Received: by 2002:a05:622a:1213:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-501183f4374mr12942481cf.14.1768161050037; Sun, 11 Jan 2026
 11:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109062419.157284-1-ranxiaokai627@163.com> <aWMLQkvushKidjQQ@moria.home.lan>
In-Reply-To: <aWMLQkvushKidjQQ@moria.home.lan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 11 Jan 2026 11:50:39 -0800
X-Gm-Features: AZwV_QgnIj5jxqjZWPNyZ1aQJCUUVXKREdt5QrSWlYWPGsMwNuUxgnEOGHpRL-k
Message-ID: <CAJuCfpGo4wYcMChX_xJJ04pHYKJ8vMPrkN9GFxXhW-1xQEmfiQ@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot parameter
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: ranxiaokai627@163.com, vbabka@suse.cz, akpm@linux-foundation.org, 
	david@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ran.xiaokai@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 10, 2026 at 6:34=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Fri, Jan 09, 2026 at 06:24:19AM +0000, ranxiaokai627@163.com wrote:
> > From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> >
> > Boot parameters prefixed with "sysctl." are processed separately
> > during the final stage of system initialization via kernel_init()->
> > do_sysctl_args(). Since mem_profiling support should be parsed
> > in early boot stage, it is unsuitable for centralized handling
> > in do_sysctl_args().
> > Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
> > the sysctl.vm.mem_profiling entry is not writable and will cause
> > a warning. To prevent duplicate processing of sysctl.vm.mem_profiling,
> > rename the boot parameter to "mem_profiling".
> >
> > Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
>
> How was this observed/detected?
>
> My reading of early_param() would seem to indicate that
> setup_early_mem_profiling() is getting called at the appropriate time -
> and then additionally a second time by do_sysctl_args(), which then
> becomes a noop.
>
> So the only bug would seem to be that the sysctl is not writeable in
> debug mode? There's an easier fix for that one...

Sorry for the delay.
That's not a bug. We want this sysctrl to be read-only when the debug
option is enabled. Otherwise if user toggles mem_profiling sysctrl off
and then on again, all allocations that were made between these events
will be missing their tags and our debug mechanism will generate
warnings for each such occurrence when freeing these allocations.
I'll look closer into this warning. Maybe we can suppress it when the
read-only sysctrl is already set to the value being assigned to it?
