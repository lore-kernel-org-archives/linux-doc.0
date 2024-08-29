Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2556189F54
	for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918845; cv=none; b=ImyZ23lU+yx6XcImPnOO0ZXL5aG+Zhzm2nSWiUtrI9FiGdqp5iSjBZWO0asmlpU4qKOp5N0EPe57FHPw8F9b4iJLjaebQaTwlzpGAAHwcnAFCERrl9ZjkPSkMX4RQQH4oy/7jNB7Id0M35E289EyPNJQyOe0Eg0Y08qA+ssl9iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918845; c=relaxed/simple;
	bh=auFqkUNyv2Fd/0ioi9ZUc3h7ws94RlEFh6JNyRARyKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TE1eesM8s42ifGMQoFh9rCws0kJuyxIx3STJ6AWz5t394F/AlnwDONKawRddk455islHDhNSeSZFyua/1bOXrLGmyQtD4NrUBHSJctM1jqv4t/i+sozqh8NgOK0+Z5TGmCcsydJZYKmN1sQ+BRPHQZthTSVvltwvciklgpjM99M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=B2ztr2RN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="B2ztr2RN"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f01b8738dso275576e87.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1724918842; x=1725523642; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rWHF4NxXib0BaVbETNyvLLP+DsSB41nEJXFZk7mMGog=;
        b=B2ztr2RNb1FOIIFk5ylbH/TWX/1Dz7k0DJGuomatkMfKZmeVQimHbB/+7mtji6pdFN
         smmiFiDsyozV9HyfoTfklN/Cr2sfFtQy+vTi9OfAPm2gHBJm04rVh714oCbrnZHPh4+D
         cZTxXMyVrQbqtWrz+ueHBogQzo+pL+QLp+9RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918842; x=1725523642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWHF4NxXib0BaVbETNyvLLP+DsSB41nEJXFZk7mMGog=;
        b=pDxIxrnuKHtEvYGyDhZej+nRdpPta2eV2Z5PigGQQmmwmNwzIeICxtUq3Ql7kfpNVo
         dZZ5wK8YFlelXPGezF1NR+ZT9ah3D2fkfcZsaCmIz0WjlZcBsT7b6isSZAmLe7pYoRTN
         0UGrewLjG0RAIA/+tfcsA/f/ecpFCDLv3KEozXjQ0OC0udAp4g4IJjQBdgtt9zDPnhEa
         t/U59Z8R5ayBwND715ej1d3zyB2IjVjmhrMP0s1HllNgSihXWIbzlqVFBRwVXna51pel
         8vDZUJrum925uPN6/2v5Ji+T9CtwWZB2hgTxcakZhMpgwTZ2bSA8oeEGZgz/RG+nqVh2
         cV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSbWL07XBRV9+6RilvU1O6/zuXBeBQX8FVkXNQTVcOVqYn3kTmXUvghba5AJvZltLyBPm3tdiVbmM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5d8pQH6ynEIVHyRV9/lYxOjiuUxu3j1p29zQLfhr1a/CpvsV
	CV21LBJFoxYpiYP27veTJa0Vo0ti9cLZsRh7/fdi7scViAoLYuP55KaaJqhNt4L4cd8Fxti0d8T
	NCUVTi3+58pEqJ3lRqMyMUmcs/XLQ7s1PnLIhlQ==
X-Google-Smtp-Source: AGHT+IGNbDJ14S2lYWoqQ5dAM0S0xuzu3UKx1UZtVenRD205hOgag/lAWnB20MTVkCtylH29xVj9OadK/FnKaKfGoUk=
X-Received: by 2002:a05:6512:6c7:b0:533:4676:c21c with SMTP id
 2adb3069b0e04-5353e5ae666mr1221299e87.44.1724918841596; Thu, 29 Aug 2024
 01:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709111918.31233-1-hreitz@redhat.com>
In-Reply-To: <20240709111918.31233-1-hreitz@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 29 Aug 2024 10:07:10 +0200
Message-ID: <CAJfpegv6T_5fFCEMcHWgLQy5xT8Dp-O5KVOXiKsh2Gd-AJHwcg@mail.gmail.com>
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
To: Hanna Czenczek <hreitz@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	Miklos Szeredi <mszeredi@redhat.com>, German Maglione <gmaglione@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2024 at 13:19, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> Hi,
>
> We want to be able to mount filesystems that just consist of one regular
> file via virtio-fs, i.e. no root directory, just a file as the root
> node.
>
> While that is possible via FUSE itself (through the 'rootmode' mount
> option, which is automatically set by the fusermount help program to
> match the mount point's inode mode), there is no virtio-fs option yet
> that would allow changing the rootmode from S_IFDIR to S_IFREG.
>
> To do that, this series introduces a new 'file' mount option that does
> precisely that.  Alternatively, we could provide the same 'rootmode'
> option that FUSE has, but as laid out in patch 1's commit description,
> that option is a bit cumbersome for virtio-fs (in a way that it is not
> for FUSE), and its usefulness as a more general option is limited.

I wonder if this is needed at all for virtiofs, which could easily do
the FUSE_INIT request synchronously with mount(2) and the server could
just tell the client the root mode explicitly in the FUSE_INIT reply,
or could just fetch it with a separate FUSE_GETATTR.

Why regular fuse doesn't do this?  That's because a single threaded
server can only be supported if the mount(2) syscall returns before
any request need processing.  Virtiofs doesn't suffer from this at
all, AFAICS.

Does this make sense?

Thanks,
Miklos
