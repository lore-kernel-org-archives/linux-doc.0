Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444783C417F
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195653; cv=pass; b=Hs8lwZZ7I6PqXKZbsEMizAv/QetsLR5nhYZj0+7DwKJIAGuKoLCntN7qTUMEstxX3NxFzBM0VktzlOlpq+nAaLWALy3S+VPblzDS+he7f0y9Xh5pkCelN0b/blvOJOtirTgITNQ06G0AUW31JcOO2kyoOGq7/ltpGljkZiiwD4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195653; c=relaxed/simple;
	bh=7L8oIlIG3rf4WDazhnd/H7jHQ5h7vpxRD/uz7HCetnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWvgzorbLL0w7Jw/5eaL4uYv7HULdSyRnyaZk3dDKUTE75Xgih0L/7WSrvc0iaGhifCp0+Ex4Wua4wQWdELt/DcUpu518qvg3d15uH/2fvVnZqbX6yXxnnGHDcXELDWftB+CZOtJ9jfGug97bmirLCooFZyQMnk7BYiGFtK5h8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaYHEdTh; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaYHEdTh"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso13376364a12.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 02:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784195650; cv=none;
        d=google.com; s=arc-20260327;
        b=DgLyifR0/+sUsXU8Y5fy4IbHzf9WO535947HzQyKAMfDW2qIbHbfz0h67nOI3w1rZS
         r/MnW6AdnuKhFulDNLvh8BMm2AsDKqIPknw/77WosG0Judp9VEXorOCrmF1JCRIoZYAA
         xJQf10tBC+eFVXWl9j++0C9AEGcrLgZiLJUcK8fWnzorrv0cuCHfuxdA1EgooYn+b9WM
         3d1uHKu3IXF+uOFc6xRv2dEqKK0dSALOywgO/H4QoZTYIoI5q57+m9hy9AdMQYvB0MnP
         MM7Fb9jBDIFvO8U/x17mMqOOU/KNFyMDUJRReAezFb1A9Htrimgv3afaFPBHgbWpaGvG
         PBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dja3c4miyO18wybLh+8+ev1hbutgDwS8v/XSKA2LxPU=;
        fh=KeESwabIRlzyTCnUFUDztV+YM0Y0i9JW+D95eocjSG8=;
        b=j9PKA/YuSxZ+cH9XlXqDLw4BQKuMIzqz+wMhwb3+9sZZ5nh5SXM7XFBxaYNaXnU+Ma
         fT1nTkaXgSCI0GToYJxp+Hd8OenLRmegwCk4U/ZjEKFPe6rTYGVn7ZN3acipvIryV/DJ
         rBWclMagwI2jtYjnmtViB0e1OO2EUWpqqcQH9bMHKN4xE2Ppco6REwXReFCeF6I7ag89
         ZxPqRmbgQFal+vA7aSSFblqGFhE42cMKkVKcrQ5KSmp0IHFx15Vy6PhFP//758F880kT
         Xx9Pbu+dIPK/dLl8xcsxtOwOHieoan08WqkcB429cAbR4TH942gFHP2xnBMEIhTFarOh
         cBSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784195650; x=1784800450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dja3c4miyO18wybLh+8+ev1hbutgDwS8v/XSKA2LxPU=;
        b=GaYHEdThr2KjAjOdDyuhg5Ng6XA6XPhZRexc96lxiVyOzcULHIsDMR8PKEmC0+4AEq
         Ljw8iAuTpomaCSzTG62lVBRK3M2KVzTRWt9CctJxiGtfi8r3RkyoUQku99jDJfbRVE0E
         37qvqjlU3eB4jCLYqqk6zfhGZC1+D9qoSjv1JHrPnVXPaBvjTcDvarRWhtTFlA40q6OB
         W2JdJZZk/7FXKcJk9VGrv0bIDbwwFo/+JwnBV+Mp/r2lxCsEKU5LWDc0yC7IThCx5CII
         RzirKWuE601P3ORG9wvBBpRajH5EOUbhsnnvz2nXSE485ufEg/ej60zARfh81LIx6cTW
         cBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195650; x=1784800450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dja3c4miyO18wybLh+8+ev1hbutgDwS8v/XSKA2LxPU=;
        b=o3AXnbU15juPDKv1WhLCvT0hr4U2rMI9FJ/Um759YJguTbDlWSe/CPUqRDH0vDIEp4
         SimD8JozQQp1qRLUNHF+n1VU6KdXQWIIy4Ojld1kSgIIRVv0X9dhq8uVI9dmNoqnp+g6
         u9e10KOxVa2W30NiX3easN7ihQR1u6GQUCINm8/8OECRGeRDVLeJhrMlBBDs6jmkPlcB
         XT5X4FPvnPS/3p2cVbaVd1petu5nFVzGEi0sVPgnC4ksizVpBVIUrvsPJEv5joAtdD+t
         LkfVUhnNi+aWEs2s9hLpuIe0cqeFD2jXnnl7KLMTfP38NiX5NpbZ4rzt7ecSGOj17omv
         lacw==
X-Forwarded-Encrypted: i=1; AHgh+RrFNjGrUvAtkJovR+gQfBKn6Oa/Eq7L+cBxgmUTYfyVVyJWp7BoxoT/71PuzSXMGlvZ0Vkmb+VhCKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3U037rtjbzowvr14FwqVPtuvGY8cJnmH/l+B47NbcP8l4h5+
	c3slw16QYV6D6Nha70LU7fFnUh+GmAEPxXfeU1BJJ0rqCHcEm/q2guzR5jlRYnGlRvBApyOyCIb
	gc9qOKAb4WVRCxuQZtgdZr3vavwX8O7KJMEw35WhLjQ==
X-Gm-Gg: AfdE7cmosLtDoVs2hAMwmb3+nIHY+yxHpDmyimCAZWOhW+YDYR3mIZnyWXDccIaU3Cl
	A9uSPx3Gz3rxLg1HvupflzK39Jdi1Ka8f6XPgbpE5UvtI7Rfsic6YTZPONOxhJVc6I/4CQjSB5d
	dVweemP/Q8h8VgJ4KPRMJAi2IcOFtj1bgh51DKi5uS9PLAwnGEcZecOhFJBfxeuE8qxK/+SXBXo
	ADxioCDMKt2sMuHtaBPn65yZBBcAiI285LwwTx1khSWd1yAqf9DpsRheGqRP90E3R4ZTNisMQ==
X-Received: by 2002:a05:6402:524a:b0:698:b60b:aac2 with SMTP id
 4fb4d7f45d1cf-69cd6c5e68amr5803177a12.4.1784195649954; Thu, 16 Jul 2026
 02:54:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-overlayfs-rst-update-v2-1-ba25393ea7a3@teledyne.com>
In-Reply-To: <20260716-overlayfs-rst-update-v2-1-ba25393ea7a3@teledyne.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 16 Jul 2026 11:53:57 +0200
X-Gm-Features: AUfX_mxljFG1PQ75khiigBYEM4d9sOeUExffSBXjeTfV6o_GpeesgVl0GqmqzLA
Message-ID: <CAOQ4uxj66enKg9jK9gZtqTCxLOSHD1i1Yj8b0Fs+jv+SN4UApw@mail.gmail.com>
Subject: Re: [PATCH v2] overlayfs.rst: remove mention of workdir needing to be empty
To: jesse.vangavere@teledyne.com, Jonathan Corbet <corbet@lwn.net>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-unionfs@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 8:23=E2=80=AFAM Jesse Van Gavere via B4 Relay
<devnull+jesse.vangavere.teledyne.com@kernel.org> wrote:
>
> From: Jesse Van Gavere <jesse.vangavere@teledyne.com>
>
> This requirement has not been true since v4.8 when automatic cleanup was
> added in commit eea2fb4851e9 ("ovl: proper cleanup of workdir")
>
> Signed-off-by: Jesse Van Gavere <jesse.vangavere@teledyne.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Jon,

Can you please pick this one?

Thanks,
Amir.

> ---
> Changes in v2:
> - Handle remark from Amir Goldstein to drop workdir cleanup reference
> - Link to v1: https://patch.msgid.link/20260715-overlayfs-rst-update-v1-1=
-70625a67880e@teledyne.com
>
> To: Miklos Szeredi <miklos@szeredi.hu>
> To: Amir Goldstein <amir73il@gmail.com>
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-unionfs@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/filesystems/overlayfs.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/file=
systems/overlayfs.rst
> index eb846518e6ac..ba41c0694e62 100644
> --- a/Documentation/filesystems/overlayfs.rst
> +++ b/Documentation/filesystems/overlayfs.rst
> @@ -123,8 +123,7 @@ At mount time, the two directories given as mount opt=
ions "lowerdir" and
>    mount -t overlay overlay -olowerdir=3D/lower,upperdir=3D/upper,\
>    workdir=3D/work /merged
>
> -The "workdir" needs to be an empty directory on the same filesystem
> -as upperdir.
> +The "workdir" needs to be a directory on the same filesystem as upperdir=
.
>
>  Then whenever a lookup is requested in such a merged directory, the
>  lookup is performed in each actual directory and the combined result
>
> ---
> base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
> change-id: 20260715-overlayfs-rst-update-750d58792f79
>
> Best regards,
> --
> Jesse Van Gavere <jesse.vangavere@teledyne.com>
>
>
