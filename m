Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB08F36195B
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 23:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785021142; cv=pass; b=QUI2Xj1F4JEwwIhWVH3s3ZQ4nXmmWeXUDfe12sl2xWQtGbPl/hQuAXCae4JMGX5VeeAmwiBga4+BSDO0nN3/6yIP7zlaoipZKz8yZNclOGrD3QpwbtfWIe5tHcz9PTm6hhuU1UUVfOt77DYoqS/TsHo5Clczu0pp2r27uAWkxyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785021142; c=relaxed/simple;
	bh=DAmD0jE2PK17f+xBvYiMfK6/+xI/1NO02XCtKo3Fu04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OyPV5pacR4dHtpMAQU8o3YQodHhn7kj0fm+YNIOlpXAnk127/9d2lukbAGOr/b20uG9Xvr7gQLByFnN4nJr1gNuoXctcRH+8k87Hb3oG3atr3vQOm0/yqfp/IM82qm3kxA1BaU9p7sspixdyWpMgVcquF07duz4xj37WaLg95gY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fbtqa0Im; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fbtqa0Im"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aec6360133so1420969e87.1
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 16:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785021139; cv=none;
        d=google.com; s=arc-20260327;
        b=A4c+k5CVjPCpnj6Twzjc9DpyZiVi/Ucv1ZAtPCP2o2rkQIsrpW8w+J+Qmtpg3Fmo7G
         pgSlPrsjfNkp6IABoIresxJFJHuQS2IglHjNxxcYsMswZTCMxK0HE+2u/deOmlTIJZ4r
         sWJd6hytf7Hxf+i+IT5PrkQ8Muaa68l1N44sytzEf5/LM2l9IVLYzXVs1QRH2yaUnAek
         ylFP0t2tawCE0u0szLlbQNJM7VhBhfD3JUToqc8Qa6J0UaAqKRsAloWDG+8QPSZNzwds
         WZNa2Z5HKcxMdChUeHxlHtexTwdEOU2s9muXVjoQIpdCSGpLfcF0lOjY4Co97Rc4kjGA
         GsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lk2bH0i2n8lot2p1pFmjvDciqXml1QGBbKWcb9+sKHI=;
        fh=LE8Cb7dBBjfXYzPz9m+2MMC7uh6+M6QPgZKSpsQCF/I=;
        b=dST6R/Kz7kN8fwiM8PgwMJR/wfeCBLV58rizRFEq30kVygVXP2AhPdxUV4qYIo09B/
         0mCbh4UEj3MisElTEG2JiGPFowlVhmZwTGKU6EJ0WOgJvac21cuZ1tLNAyY7tGiqPys4
         Sc+U00a+RJtZh1hruRLxGsbnxMJePmsKI74XfnlTCeOUw1iVnGhOxNUEoMWtybq73BS7
         RzA4bH8AEId3nqoVukqE+V1vPo1pR55HRMoGuFEMmNGQInoyVFrEZKIn8D25Wyke3/cg
         9+NHZ5qqeztDp2UQs278P/eHp8cnV5rBZSYo65RRZpXp6Rd7QfAdv4IDqM0UgVNuXBVJ
         44wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785021139; x=1785625939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lk2bH0i2n8lot2p1pFmjvDciqXml1QGBbKWcb9+sKHI=;
        b=Fbtqa0ImwZXH2c0g9nJEgrcQ7+GrYuuu+oosptTVAYew+Qd2W8ajOhpnCZ39xuyHZj
         1U+oln2wnPJNLLUAUK9h3UEs0+90grj5nxwRxzOZyiSMcJAcWWqZWZKI71O21ZavRYa3
         edoiwFcFRvLSmqpDN7xYzlaV+aOtBlCwX27JNxWpghrZQP4Xrjlj2FsC25OGf6oXCvxW
         dlQZtVkUL11ekR/md78zRCHQ0d4IVK/40Nn252ryCuGSNctm37pUrU/CA+QzGGmCt3iK
         XnTJ8SHUBB45nmsRXk2H9woA1S4p1GxuQyQT1oAiYVhHRBrRyO9WXLIYtNg5GzyFmIYc
         pXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785021139; x=1785625939;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lk2bH0i2n8lot2p1pFmjvDciqXml1QGBbKWcb9+sKHI=;
        b=ZtOFBrmvakxMeQ51OCvMhRnQMiOpPU3U9aDQ2GRb+8gaMGi1KlRqW6RrgfaTp3tZ/x
         Xy780688VUUcIhVgs/pNxkOGdFqenNnoGVt6zVJ6OTwJ6hF32G7/FUT8ls4z90fZvuoi
         Gr3mYPHGJREBjJWlwQzW5hTUwW0YCtvWTKbX4h5TSHHw1GlKiBQoP/nngBA5pbnviEZb
         5M1gEwNrbmUOJjREZF9lOlRq5r2ba8PpwAFye48XjLcAFg0FxLDBqF/SYFiesnFGWJBn
         a3FwAT6uPfPuKXuI+XQHHIZXw6XgoUqVVcdUx5dABI62lx/T6e50BtlSmE1wIopC0JNa
         trcg==
X-Forwarded-Encrypted: i=1; AHgh+RohzzXwXKL5CYQH7adI/IHnIGe8VoY1XWbPncTYKBRYkI2R7Zn3BwUSkColkDns5Ua8I0lVnM1tSfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhIee0V0oW1F7hFeu5Kj9+jSajpszdwGPsEAzGx5TqZza1hf4/
	fHNNbW0yPPaWWtL6klU/qQh6JWwmHjGuQzXCi0LwoQ2U2IM7L2PXSldWcnQFDkGnjCv9QfAiee4
	8l9CdTl77e2Q+G1+QmqnK7B+D2iSkmNCKpPjn
X-Gm-Gg: AR+sD105nndWEybhJ0kResDR7PVpFcXz+96PynvqTixvWVOcF68NybnVDeKaSV978lh
	vxk7LPXUrVwCpbDdby1ZH2D8clElkgik9skU+96p7Ca3OwHvu4fMIfeIvMJWENK5ZTaU3AUF4nL
	u4MEv4Ewe7qLztLzuJt+bzopqSOeU8Murkqo0Ji7tocMZ4WMTIhsJgrnbdjwt6G1R7vSqsuE+o4
	HHnu6XWWJEhTjhu6tmVnqGSD+mxsYPREuCFqbpOhTVOQEWqxyX7dQmKJaKRACWGRDS7YJ3FjA==
X-Received: by 2002:a05:6512:159e:b0:5b0:1df9:2adf with SMTP id
 2adb3069b0e04-5b2c1b23c13mr536444e87.28.1785021138444; Sat, 25 Jul 2026
 16:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260725100658.1705-1-manojkm24dev@gmail.com>
In-Reply-To: <20260725100658.1705-1-manojkm24dev@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 26 Jul 2026 08:12:02 +0900
X-Gm-Features: AUfX_mxFyNnlo3VPzMH4bN1g0GZY_Ni5XJHOJ1l_LeDcBVAW4ZagKbK1c2UAVdI
Message-ID: <CAKFNMo=zApDzM10dv66TgcKcvJyzWmur=88zRpfK=br_BGY02w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: fix grammar in description of nilfs2
 recovery code
To: Manoj K M <manojkm24dev@gmail.com>, slava@dubeyko.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-nilfs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 7:07=E2=80=AFPM Manoj K M wrote:
>
> Include the word 'at' to make the sentence grammatically correct
> inside the description for nilfs2 recovery code. This improves
> documentation without changing the original meaning.
>
> Signed-off-by: Manoj K M <manojkm24dev@gmail.com>
> ---
>  Documentation/filesystems/nilfs2.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/nilfs2.rst b/Documentation/filesys=
tems/nilfs2.rst
> index e3a5c8977..a0124d22a 100644
> --- a/Documentation/filesystems/nilfs2.rst
> +++ b/Documentation/filesystems/nilfs2.rst
> @@ -252,7 +252,7 @@ The following figure shows a typical organization of =
the logs::
>  To stride over segment boundaries, this sequence of files may be split
>  into multiple logs.  The sequence of logs that should be treated as
>  logically one log, is delimited with flags marked in the segment
> -summary.  The recovery code of nilfs2 looks this boundary information
> +summary.  The recovery code of nilfs2 looks at this boundary information
>  to ensure atomicity of updates.
>
>  The super root block is inserted for every checkpoints.  It includes
> --
> 2.53.0
>

Thank you for the fix!

Viacheslav, could you please pick this up directly into your tree?

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi
