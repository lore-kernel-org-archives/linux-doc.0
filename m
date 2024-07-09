Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2F313A25F
	for <linux-doc@vger.kernel.org>; Tue,  9 Jul 2024 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523970; cv=none; b=VaLaKfrlK/bMPuDvGRMdQbiSKmtqwTS/1VxsuF3ksFJDiV5rRZn05e0cZsf9ak6tykMd+B7hiQN9GlutSai69eToududvlwJ239OvNFht2t9zX6frKogTDfJgOTQn/I0UjrDkTeanGaa8MOtA07sIZ6Fc/lNVsQ6+yd8DfW5CLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523970; c=relaxed/simple;
	bh=BItnevYQftOCRFmTco7LyFoPZ4oUphW+9VYSudo+9NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cDi71xKTfCwqECuzUpv1QzZYKqbfPaOqOzjm4//ULcev3Wz9t02ltdHk7FJjlCot1eg5JXamsP2JRhXnVloLvjaytXEPWgZMkD+ymkkrOzwAetVvgs8yrCRmVO7cHPsDFPay59rpCk4Afjrq9GhK0ij/8ncnnimqGF5OE6btuas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AsKztbHE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AsKztbHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720523967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qwbHLNXPzAR/N/8uXrZSRmFQ5c/uLTMXj08MAhKvTTE=;
	b=AsKztbHEKoLn0J3GYHUncxFaFy3gVR3kIaTIetzSQCElMA94IIgPUTh+tYUrA4Z+yhmU1F
	CKOpDyk+PBUW11NWx+SyfBwIvBzjZUVZbu/UNnG4N4+t2x2PbHxtEnXY3+mVZ7Uo5jJbME
	cjYVk0VlWrxWm6od/h4rnvIcUe5FOxs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-YL7LuBAtPfOlw2P_ve3A-Q-1; Tue, 09 Jul 2024 07:19:25 -0400
X-MC-Unique: YL7LuBAtPfOlw2P_ve3A-Q-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ee94b0e2e1so45863421fa.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2024 04:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523964; x=1721128764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwbHLNXPzAR/N/8uXrZSRmFQ5c/uLTMXj08MAhKvTTE=;
        b=Yla2zS9mxMAfVgawr2ggbeVdhiKphISi0GiLY7JT6hm54WX3obY/sC+YlwMWCrVRL1
         +w3WU/FhKIvb5d5rHRbxm7t/bQqV5YY2HsklBysH0c/aWQcZWKK1DX0Fkxt4y4g+YbhW
         8NArXpiTrYlK8Z3TMNtKk1cBSzt4Z6whpaoKoCUsGZ7LXr+I7DD/J11Ff4eMl+a+sOp8
         akFd9JWu2Gq1Qecf4VgvlMQ4diOU13+j5Qh6WE6csckq8IuSup69zg5JHU2ApXFx2g6L
         UA44G6vEz2hFnxAzoyFXDaNmd+HY8TqmahUrQNb/VDdkBGZkHTmrv9sWAsvFHJxT44CH
         k3bw==
X-Forwarded-Encrypted: i=1; AJvYcCVzZ9c01udloiVdrBInMw0n87ev02dElTuW0KVcvPZYOt5K+B/ze9hWwJLW9t5/7cUbkQvnvKKL00/ryBOS3a01d8Ewq2MiteSd
X-Gm-Message-State: AOJu0Yw6/hIeewgeuRa3v4Y9+qSb8I6DXWwHGOaxHGMTFHBJaTaJDMLN
	CijW8TixDEj4MQnI4V82htIuks0FnzCvFPWjIeMdMIrHPbxgu541z1q/9mThof8Q1AAJuGciLmW
	unSD5+TAsgaNt7M/SVJ4dYQXKuUiTs+VBXLHfbNu+9ilAMLaxHSbIN5RmWQ==
X-Received: by 2002:a2e:9f03:0:b0:2ee:4ccf:ca4f with SMTP id 38308e7fff4ca-2eeb3101de6mr16104941fa.31.1720523964486;
        Tue, 09 Jul 2024 04:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFGxEpvT2wnJU72VkvZj7q8tuPCVpDDqG6kBc7TA4IZyQG8gcuy+uWDWNgH2hnWmFNmVBcCQ==
X-Received: by 2002:a2e:9f03:0:b0:2ee:4ccf:ca4f with SMTP id 38308e7fff4ca-2eeb3101de6mr16104291fa.31.1720523962911;
        Tue, 09 Jul 2024 04:19:22 -0700 (PDT)
Received: from localhost (p200300cfd74b1c2b6d9a10b1cecd2745.dip0.t-ipconnect.de. [2003:cf:d74b:1c2b:6d9a:10b1:cecd:2745])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa078fsm2244778f8f.71.2024.07.09.04.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 04:19:21 -0700 (PDT)
From: Hanna Czenczek <hreitz@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: Hanna Czenczek <hreitz@redhat.com>,
	Miklos Szeredi <mszeredi@redhat.com>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: [PATCH 0/2] virtio-fs: Add 'file' mount option
Date: Tue,  9 Jul 2024 13:19:16 +0200
Message-ID: <20240709111918.31233-1-hreitz@redhat.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

We want to be able to mount filesystems that just consist of one regular
file via virtio-fs, i.e. no root directory, just a file as the root
node.

While that is possible via FUSE itself (through the 'rootmode' mount
option, which is automatically set by the fusermount help program to
match the mount point's inode mode), there is no virtio-fs option yet
that would allow changing the rootmode from S_IFDIR to S_IFREG.

To do that, this series introduces a new 'file' mount option that does
precisely that.  Alternatively, we could provide the same 'rootmode'
option that FUSE has, but as laid out in patch 1's commit description,
that option is a bit cumbersome for virtio-fs (in a way that it is not
for FUSE), and its usefulness as a more general option is limited.


Hanna Czenczek (2):
  virtio-fs: Add 'file' mount option
  virtio-fs: Document 'file' mount option

 fs/fuse/virtio_fs.c                    | 9 ++++++++-
 Documentation/filesystems/virtiofs.rst | 5 ++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.45.1

