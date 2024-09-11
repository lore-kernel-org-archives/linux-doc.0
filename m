Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D7187866
	for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 13:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726061421; cv=none; b=O5GNs5i+sw67ezNkKkpxv2Sz3l/4wpYnEJNT1+amARUwFQ1bztOnQqdditbnPBlIdHUWAcu9AFckUVswFr10dexax+1bbUoMQyX8+OGh0pLTnewjNS9s1r01P0bNdnt9L2nyHD5DY9MqfWlrHPazxOevgRI8pjzl7+NQGd7aFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726061421; c=relaxed/simple;
	bh=1UFnkWXj4010ORyqxKQFJeG3r1hAQw+6jisWkCYQSsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DgR1MgW96MyeitMqe8T5uoTBaiXjMLx/gakPCN7SfxwXuFWGZ0m2OCiOuKRCKea+7qKnjPd2Ii2j0w2OoT0qdzyaxSJ0IpR8BP0tQxKHBPYIShfnp/ObYIXQuzc4iqXfbXuItXlULApHPxa08p6yL4nVq1/GbkTeZ5Zm2+B2LuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve96OnyR; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve96OnyR"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5e19b16568cso3327701eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726061419; x=1726666219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDTpcv7TVwnQDn+Its9HB2cUcJxnVMv3Y+MamIvXPWM=;
        b=Ve96OnyRhR9uUtqxmBFHAY3yytK0h1aR6ZG6xZHz1Av2nqFcyQBpxxmFWA2+OlZIUx
         sLgRxW1xq/SHwgT6i83a6iRikXpXms2YnhmpggpkEkjmceiRy2G1aaMXKXoNLNQrrA8A
         XUEPSpLeDYKUXH+QsXndVcolkHh9is+iF5aqXspiAmgMxXzVAlmCk4IiuXarUqGJXPdR
         UjPXKFPfa8ekM9EzUoQKvq9Sm3C0MgycAufoQC6w0HuXwJP4ny8ze83mVAU2ke33MMg+
         pIryM7vWXVP2xDD7MOObg1Ru0pN50GZNbp0wy8AMJc4SQ5NEqOEL0z0ZxK++HZqerPRU
         1Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726061419; x=1726666219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDTpcv7TVwnQDn+Its9HB2cUcJxnVMv3Y+MamIvXPWM=;
        b=ix1mSN+IEb94pGt5Hqxb8xzydkCwlmalNg2akbq9nwf1mhUd7uTjxKt71/BCXZa77D
         7nmntg8b8S81f48mdp0vyM6F+hVXJm77fkxErmg00si9qMPGxhtMO3ra49GAlyevpwJX
         Lq+xSU8xUYtyS6HQOkBZZs0Ggky3ZEw39550q9F2dr+VxoSaimlVB6Mq7PowAnh4daC2
         wvVAZ3+fkMSd3aKbeztTQuRc+s0uV/TdjetwHWZtupBNcv4SVYJ02UknA6Br89BpoOk5
         udurg1uK1ZCz4oCEFgx0TsGFfv+/Gwf+fzCpqwjhuAu8XENXd3kU2S3jp+ZeGxb3Qqc9
         EWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4XFgwMBJi9qkgTT8fAF+llSt+817XdLCTPKTeqZUtplbsNXF8qyV/nB7mdsXc/eazk0gcxiJ8FVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0T4TIRVbu5wNYIA6A0RblF2GZ7gYWME8NW9+3zPBYdfeTfiRJ
	ifjh8arFRWncUbLiIYHOhsCJ5m6z5UDN3ocs229lJBGaOmEQoJX4iG/dJO1ywze1/Z0xr3mkf0V
	NvClRkpRiVFRvZFaZhSVNHAJVXc4=
X-Google-Smtp-Source: AGHT+IHsIBxJlVceGO8fR9SZpOokHJjO8a9dBePoVUVQRMSAOZMxxjZIU0y1lC62OB79ApEJKTWQa2QU+f/AxXrsWFs=
X-Received: by 2002:a05:6871:1c6:b0:260:ff2f:9d24 with SMTP id
 586e51a60fabf-27b82f95c42mr15951222fac.33.1726061418569; Wed, 11 Sep 2024
 06:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75028548-2c1b-4ffd-91e5-9f3ae72d9c3e@gmail.com>
In-Reply-To: <75028548-2c1b-4ffd-91e5-9f3ae72d9c3e@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 11 Sep 2024 21:29:52 +0800
Message-ID: <CAD-N9QVuQ2+mG+S7Acp2HuUSOzqb2Bj4XW2UGWXKHx0zWbgBRw@mail.gmail.com>
Subject: Re: original file finding
To: Alex Shi <seakeel@gmail.com>, Cheng Ziqiu <chengziqiu@hust.edu.cn>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 6:11=E2=80=AFPM Alex Shi <seakeel@gmail.com> wrote:
>
> Hi Dongliang:
>
> In scripts/checktransupdate.py,
> def get_origin_path(file_path):
>     paths =3D file_path.split("/")
>     tidx =3D paths.index("translations")
>     opaths =3D paths[:tidx]
>     opaths +=3D paths[tidx + 2 :]
>     return "/".join(opaths)

cc +ziqiu

Could you take a look at this function?

>
> It use a different way instead of the ':Original:' line to find out the o=
rigin file.
> That may cause file finding failed if we have a different dir map for tra=
nslation.

Yes, this is more reasonable. BTW, is this enforced in the Chinese or
other language translation?

>
> Yes, we have no worry since all of them are same. But could we take the '=
:Original:' usage for a possible dir map changes?

Yeah, at least we can take the current method as backup for original
file location.

>
> Anyway, just a quick idea.
>
> Thanks
> Alex
>
