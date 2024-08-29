Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7B1A3BC3
	for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724937704; cv=none; b=s+dtrOikwOzZ3djzMrP9WEuoP48D5WQDRLo2IqTcLbmTRqNkbp0FhhZyX6NUEWA7uQljrl4juU1mPdR6CqEytxzczA52T8xuac9DW6+MK6vWpMq+dyjBEPbdtuOAB9DIkQ9Nv3nGz5JDjZwK6XnIitmr+fp5eVhut8mSVbvB7O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724937704; c=relaxed/simple;
	bh=hdV4rZzJMRAJBVUYw2ja547l7Uw/TfehnV91g5CT5jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEnqr5K56XjzZDKYxnDCO1v4ODl8AUxM2vABg3/DATd5H3bBmBmowRY1jawXhgYEZWt0BGa7dH5Rvaj/uTgPTTZg4qTMK3tZN4pKrSprBdzR9Mm8N3jvBXsOy1MhqHsjXbUuaAUW568YbWOredimtqDDeDU8rLDD5jbp4vCWz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=XxD0rm7L; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="XxD0rm7L"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e13cda45037so686804276.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1724937702; x=1725542502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17X032zDJy+/0wMUgmzbwhIMKf3z2lFl5ldVJ4sPDf0=;
        b=XxD0rm7LkOJAUwXzSkLZwRdHMjy+qM0ZOIWLviQVXMMT74B3prBKxtMy+JEoamWEBm
         6HypZTVcDb1nRr9nptpDfzz9dfqDQ1onIG1goU7zLNnCE0YBL7gwOyGjmap1eMCyY74i
         v31jstwuVtK23YqSv5tmT2ZCMecR7tCEqnhFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724937702; x=1725542502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17X032zDJy+/0wMUgmzbwhIMKf3z2lFl5ldVJ4sPDf0=;
        b=ldrmD5IWDPFd/9/H4345Iy4Qa5m6rW/ABpKE8DLnVPy8Viv8y3FEUpNi58xMsRORPZ
         YxOo3PPRL0JlOFremN5R7Twumk3UqQuS9/vvfgdKiNe6Kb/1nAvGjYcWjUfZ2Ohp8r/n
         t6x+qp4WTFEjl6dxxYC8KoEKDO1EtaWOdn+ZGAp2Rs9CMTf87o/mxJYZKj252T1K7+l/
         UfX7IiF/Utrb4iRXQE4KvNWLpXbeLKv9HvmNun15gGlPFN4ePrWqj45WRKnY3Wv1PuRY
         UcuWCXhU7ODqnMInSwLN2uhMMqF4d+bVrAZN1UkWoR27NNmEGE94BPdbVtCt11LnRd+G
         u8Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV7RYvYwZ7Ui509RolM/W7Tsm6gjRZvEC3dL7P8d9sN99lYaJN+Q/k5kIRMzoqFESmjhfkoZbSX5h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRsAgym9qVQdNcoTXc+rLqcvkF+7Rp/fGxVftFEhPRMVNux4Ef
	U3uNARh2PLgW52gaco8pFo4TnXHTUMT7XsM8s8J+lSIhxv3lCz73iTz1GVzoB7kPj1gfA07dHI5
	ewox6mA+mdC0jCRXw7k7R8iaTe/7Xevu7Lb1HRg==
X-Google-Smtp-Source: AGHT+IGFmmq4KYWULCCzqEFKek25OxK9x8oLjmoZmu8m4Sd2SvnaVWUH+kbP/SjW5Ho91ld6gT2dR61FWiPYKjgvHmQ=
X-Received: by 2002:a05:690c:2f0a:b0:6b0:d9bc:5a29 with SMTP id
 00721157ae682-6d277a7927emr26497587b3.32.1724937702395; Thu, 29 Aug 2024
 06:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709111918.31233-1-hreitz@redhat.com> <CAJfpegv6T_5fFCEMcHWgLQy5xT8Dp-O5KVOXiKsh2Gd-AJHwcg@mail.gmail.com>
 <19017a78-b14a-4998-8ebb-f3ffdbfae5b8@redhat.com> <CAJfpegs0Y3bmsw3jThaV+PboQEsWWoQYBLZwkqx9sLMAdqCa6Q@mail.gmail.com>
 <b82dd5f9-a214-4a13-b500-38b07f1e9761@redhat.com>
In-Reply-To: <b82dd5f9-a214-4a13-b500-38b07f1e9761@redhat.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 29 Aug 2024 15:21:30 +0200
Message-ID: <CAJfpeguO_jt=fR+kMkmbJDtbD9f-+fAafkmS+CbE0qE_Z2wFug@mail.gmail.com>
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
To: Hanna Czenczek <hreitz@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	Miklos Szeredi <mszeredi@redhat.com>, German Maglione <gmaglione@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Aug 2024 at 15:11, Hanna Czenczek <hreitz@redhat.com> wrote:

> Hm, I thought we set some things in fuse_mount and fuse_conn in there tha=
t are then queried by fuse_send_init()...  Maybe the only thing fuse_send_i=
nit() needs is fm->sb->s_bdi->ra_pages for max_readahead.

Yes, that definitely needs special treatment.

> Sounds simple.  Do you think semantically it=E2=80=99s find to block here=
?  We=E2=80=99d only do it for virtio-fs, so a denial-of-service may not be=
 of concern here.

It should be okay.  AFAIK all network filesystems block mount(2) until
setup is complete.

Thanks,
Miklos
