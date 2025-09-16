Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02A62F7456
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758030142; cv=none; b=G1XYku7WERx4QvtjTFDaGorUNj047tXsjdpAdEfK9eoDHRsMFtDC8+nste8nJp5gpsbfdfnwUOhoUVTpaXPp0nRfRQCFCHrkGkQ9Q5963mE3R3I2hxiBXUm/VOEcjD11v8bREiIPIXxNJt7OQzxNbaqDc2U0uHu2GufqIcFKEtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758030142; c=relaxed/simple;
	bh=vdr5u5q9Bhj48crDv1gBhQAyvxe62lx71S66JxSvogA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOTOq3uyTgsXvJ1mvI2YKe/3VW+s7TpBlAd6dwvluoK9wEIBKUTz312UyrklkGOj9DATOgGeUXK1phUQioMmU8yCukAA3fcknuh8QeENJoseuFg7OmRjpmDidRmgSpEZcWwkBfU7GtQMkVfGtd7dTpCDOoiOPMz8JhtirYlDv4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvZ/T4ya; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvZ/T4ya"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae31caso976582066b.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758030139; x=1758634939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDOzSlxCOtDzcq9eIlh4Lly5zShsc9FWB3XHBDP+e2s=;
        b=IvZ/T4yae3wlfJlbt2zzKfoaz5A7yYBdexXjf2u12tbKK2N5QNpl3AYkmemW4De2Qt
         7eUw2yYzI1HG5LXBCK9NHYWEirQuoBsuzQpz0Szf/8jFIvPtnk3Zys8Z0PGE+qCabZWa
         gC9DxErx3o4+u3bbA9pvmEsPsdN/svN8vg9xnmS12KhbDU8dDao4zK5guA4xLFLrn1MT
         aXMIcSrAvcJe6+6Nv4Fo71dJfgITPMTZ6ftzy7rUk/w74RMYIM53Kew+QVl6awqs8yhh
         F3F9tf+8lIW1gEewbN1qNt+0L/ismpj6zabRWug+kgmzkQRMxGjG6BSpTv5tJWI+tVTd
         Jc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758030139; x=1758634939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDOzSlxCOtDzcq9eIlh4Lly5zShsc9FWB3XHBDP+e2s=;
        b=JbGo4oAE6v3pT0PmDz4T+5j3O4DH/bI7lPmEmSPEKESby8HT5bEzIZxfJFgbRw2WBx
         lumqTQ+DDeuV0K1BuX+Rnj/l87JFGIkdt5iTw1ub00jJGD/8YLPESO3kdtNep9YuooL1
         06rubeLuSY3MQcgXjG1dpPpSgi/WRXS4VQiBCAuvZdjNQzrOSDHI/7vz36eZG9EBmBIh
         S6EYB6mMEew/K1VZUmjw1w72FwRPS4veHXtGGBIYF0c5DPUIctuyM2QXQ85/gfZ4XxZX
         OIDPExmISBvifTz51JVlUTRpYZhufpfQrpP6beTmvexf8EZccHz8HTcXmSpY7PlXAATN
         G3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWPiWsPOJTCxgHCuZo8hxrIAjSUxoPTiKahUGxiCD1D83nnk2hUg7oda1q18O3ff3SfNBnUa7Pn3e4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWUyDunXUbDW3BQ/CX2kyBcK+KdFP99LuadpL9ugUZ4E4SFNNU
	VLqQcYFKEC56C1cg9lN4yAJ4UC6QL7FwaE7sQdYIhYVKmytVvgb119nn6WjOvy7X6xc7+X2WvjL
	hmv7fbo0uq3x9IG6JcPwz0mj+irCxBtU=
X-Gm-Gg: ASbGncv1f77zizCVMkFBw7G1BvXcg4ij+JPeJg/HhwYE6EETPq5vFe5DwY+//Ah+7yI
	BF6KhtNoN0Q3yAbd72gkQPduR7p+CrrWCwSduBdCHuTeaXiLF9a3GcCo7rhaMDgNA3NAaRBJAyZ
	/xYBsOosmROPjXWEXXeAeaiC5TcX1NMeiWaZ1wAnld0z22OL1VButVCel3MaDCeEqT90KL4GpN7
	nEBrJ0=
X-Google-Smtp-Source: AGHT+IESTWeH4wSxjUaitY/65yvL9/8pzc5zN9froOQ+oJHxJy2uWXIcKOi3fMWT1IW9U5NJbPpKnRWop2D6Pg2q27M=
X-Received: by 2002:a17:907:3e21:b0:b04:5e64:d7ce with SMTP id
 a640c23a62f3a-b07c381eb0emr1760478266b.35.1758030138986; Tue, 16 Sep 2025
 06:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826185643235jApHbqi4zaPaZWVy6_Pot@zte.com.cn>
In-Reply-To: <20250826185643235jApHbqi4zaPaZWVy6_Pot@zte.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Tue, 16 Sep 2025 21:41:42 +0800
X-Gm-Features: AS18NWAzvTU5pCxBju5qtOwMpUpsMins7tNgGMYJPeMC-JL7B2y_3lBiKBu_7JA
Message-ID: <CAJy-Amk5UTE2HN_Pcd5kbvCsa247CZ9sSMNX==itXeJkWuj-NQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Docs/zh_CN: Translate filesystems docs to
 Simplified Chinese
To: shao.mingyin@zte.com.cn
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, yang.tao172@zte.com.cn, 
	wang.longjie1@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied! Thanks!
Alex

<shao.mingyin@zte.com.cn> =E4=BA=8E2025=E5=B9=B48=E6=9C=8826=E6=97=A5=E5=91=
=A8=E4=BA=8C 19:12=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> translate the filesystems docs into Simplified Chinese.
> v3->v4
> resolve patch damage issues.
>
> Shao Mingyin (5):
> Docs/zh_CN: Translate ubifs.rst to Simplified Chinese
> Docs/zh_CN: Translate ubifs-authentication.rst to Simplified Chinese
> Docs/zh_CN: Translate gfs2.rst to Simplified Chinese
> Docs/zh_CN: Translate gfs2-uevents.rst to Simplified Chinese
> Docs/zh_CN: Translate gfs2-glocks.rst to Simplified Chinese
>
> Wang Longjie (2):
> Docs/zh_CN: Translate dnotify.rst to Simplified Chinese
> Docs/zh_CN: Translate inotify.rst to Simplified Chinese
>
>  .../zh_CN/filesystems/dnotify.rst             |  67 ++++
>  .../zh_CN/filesystems/gfs2-glocks.rst         | 199 ++++++++++
>  .../zh_CN/filesystems/gfs2-uevents.rst        |  97 +++++
>  .../translations/zh_CN/filesystems/gfs2.rst   |  57 +++
>  .../translations/zh_CN/filesystems/index.rst  |  17 +-
>  .../zh_CN/filesystems/inotify.rst             |  80 ++++
>  .../filesystems/ubifs-authentication.rst      | 354 ++++++++++++++++++
>  .../translations/zh_CN/filesystems/ubifs.rst  | 114 ++++++
>  8 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/filesystems/dnotify.=
rst
>  create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2-glo=
cks.rst
>  create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2-uev=
ents.rst
>  create mode 100644 Documentation/translations/zh_CN/filesystems/gfs2.rst
>  create mode 100644 Documentation/translations/zh_CN/filesystems/inotify.=
rst
>  create mode 100644 Documentation/translations/zh_CN/filesystems/ubifs-au=
thentication.rst
>  create mode 100644 Documentation/translations/zh_CN/filesystems/ubifs.rs=
t
