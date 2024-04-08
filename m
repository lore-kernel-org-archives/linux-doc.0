Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719842AF14
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 22:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712616781; cv=none; b=O9gewzMOkITsAAWMs0Gaht7rBTCIc669ATUtd3gSr7jIGRyl17FwinIC8nVaED+1srkYx+bNlVFSv5daL35sqTQ4vf9N1W3uKA5x2YxnQAfqNQoXc37CeIFfLrBrZ7lqXDxqK0nSxyKztE0+sxxq/p0sVVmDkeKAGb1yjcrB8JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712616781; c=relaxed/simple;
	bh=5fIZfMiZLT9PI+iBH9mUuQRl4InbsAmAUPt5GNhAgws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eK2SCFzvFev9fxK5XfYqSas1jTEpiXcyHykP+jhL8GS5gt304JQI4wWKn6vTb+r+kttIy403jxQk74KxBhg3zotywF34xIKrd6ioFsFFXOGS+NssMaj7XTK6/dwmIzL5tw32iYmZzXCRQwVSojVb61StBwmRb0CtT8vYtsMvMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfsMG6DS; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfsMG6DS"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso1593207b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 15:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712616780; x=1713221580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfJh8d387N7rSSjcIMDr9KOCrpACJYFzOd9e4x1vZA0=;
        b=GfsMG6DShGJizr3Nu/k3MaeVm7v9PSd4nqdpv2XcKxKVG4yy7VDjycqna9mlLCje2Z
         sMZ2pWHK0obHYsNKyJbD/57qT36yzYqrJj5m2r0Su3Us/Y/jBym2uCxT1qiQAyr+4IFm
         cH7ECaI70NaH5PtGvzJ0mQh/CJqtW86tXX/t/cN2k2kL9zC7U6xlTkFE/2ZAVuo39Hz5
         wfs04TeWdtbFgebgVuaLMtq9wrC5fUEQ1wqO59rlcAt2TAh25qysyQ9nHkbhEXjnAvaz
         v2m3SO99qBnRvd/fBDumipquL8FVfv1uyATI8hrvwmAql4xkIUbIFjZbnjsF6Pav3+m0
         kfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712616780; x=1713221580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfJh8d387N7rSSjcIMDr9KOCrpACJYFzOd9e4x1vZA0=;
        b=Gkd/ojBPd0zWa7Vi16+i4HL3mcCFhaz8x8qCkKXYgvPUN6yytO8+Bq9dO9Nxvt3poH
         bsUQjwzBH2ueser6PdtvTiVb+p/RnwU9cTk/W1GVhwiSGSPthwHlcn3BB5frgMFn9KaZ
         hppqUL6e/sFtcWrbRCTF1hMnG2i5xxRlMwMznVbket7iT0sd2TtfAy/7uLBEFxYtOZhx
         RW9CcTR3tIyH7imQmK1G7ogQRWRagBBQ6QGTsnqTcUwj92ct9BQnX8A+WqENQ2YQQrPG
         zgiD4ipVdTnmel5f0BOKXgyP14GMwZlf5y50FRKOqedWiIsN6ceMPCXbl3+efTpa7DCo
         mTIA==
X-Forwarded-Encrypted: i=1; AJvYcCXlj1U4mEcd4gnoLpuQadnovV3KUUUYfLqG6gIWQmpcGoEUTtmX5pz4BqqmiGE9yTdhhc5SBWIQFQWu4I5bqRe9/qrnzv/b+GMQ
X-Gm-Message-State: AOJu0YyhirZO/R4AC/RQW2ZjyIriFXiTi6hH1x6zFmViJ07sPytBy955
	Zfmg+AoNGgm96pAZPjF+ONnVFVXwuuLO7LlSjgQCo6OOk2mOEhvsshUSgljA4wk2/9V4ruNF/bu
	3ZDe145XuYQwrlwzBB+9gF0KsCBk=
X-Google-Smtp-Source: AGHT+IF/qCwCMXstJyhBYi2r/FOGdr+2OEy0jlCB7RA5oy8mD8/vMM6IqVY5tFC55wdoyhY6OL596/NJR44k2FaGzns=
X-Received: by 2002:a05:6a20:6f8a:b0:1a7:48dd:3737 with SMTP id
 gv10-20020a056a206f8a00b001a748dd3737mr9780283pzb.41.1712616779625; Mon, 08
 Apr 2024 15:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406-doc-gpu-v1-1-fe0ad057ac7e@kernel.org>
In-Reply-To: <20240406-doc-gpu-v1-1-fe0ad057ac7e@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Apr 2024 18:52:47 -0400
Message-ID: <CADnq5_NcJppSveEKAEWFQ5WJmKu4QwZYff=LN8Rvxd9MfzMN5g@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: correct path of reference
To: Simon Horman <horms@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Maxime Ripard <mripard@kernel.org>, 
	Hamza Mahfooz <hamza.mahfooz@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Sat, Apr 6, 2024 at 11:52=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> The path to GPU documentation is Documentation/gpu
> rather than Documentation/GPU
>
> This appears to have been introduced by commit ba162ae749a5
> ("Documentation/gpu: Introduce a simple contribution list for display cod=
e")
>
> Flagged by make htmldocs.
>
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  Documentation/gpu/amdgpu/display/display-contributing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/amdgpu/display/display-contributing.rst b/=
Documentation/gpu/amdgpu/display/display-contributing.rst
> index fdb2bea01d53..36f3077eee00 100644
> --- a/Documentation/gpu/amdgpu/display/display-contributing.rst
> +++ b/Documentation/gpu/amdgpu/display/display-contributing.rst
> @@ -135,7 +135,7 @@ Enable underlay
>  ---------------
>
>  AMD display has this feature called underlay (which you can read more ab=
out at
> -'Documentation/GPU/amdgpu/display/mpo-overview.rst') which is intended t=
o
> +'Documentation/gpu/amdgpu/display/mpo-overview.rst') which is intended t=
o
>  save power when playing a video. The basic idea is to put a video in the
>  underlay plane at the bottom and the desktop in the plane above it with =
a hole
>  in the video area. This feature is enabled in ChromeOS, and from our dat=
a
>
