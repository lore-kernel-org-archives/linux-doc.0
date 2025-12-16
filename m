Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD216D9C2
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 00:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844024; cv=none; b=Vn6cIq/5nGV+PCHaevIcuBgLlFKxdR9bYZjri7lO8kKCY30IBT1mPI10tqvVTgiXgA8rWSSRg40ohYlziIrKLHZ/zw5dhRWM1uXI8SwgDREljPeQZgZIz9EJFfmHmtDsDgJfPRLXOCitl9SK36BVcbgHa27RjPigG/FPX49fgQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844024; c=relaxed/simple;
	bh=bozqr7ST7ZDLJLFdBwcqvBek5ZHWUh5MQd7q5BnWU6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gg9r8eTyFiO0QZPS9BdzSBhJZK33fSYB8dhXxlhdIWUS7Q0OUH2qnF51FYaajTAR69eZ9iuvACW6aKlO6fTNVh85CgcNcPEQrw2nyJFt5wsSV8NO2SpZyIwGlBebOTV9v4nhTQD0FlICGUKkhw7jD5ttMv/1pnxp34+6zq50vuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx4BjOtc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx4BjOtc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0bb2f093aso21712425ad.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 16:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765844022; x=1766448822; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJXH/uiRoHhuih5/I2ODx7WhEy17OS2PU1TLwkzpYUE=;
        b=Fx4BjOtcaQKIdzgciaQua55EUKQKCmlpEk3f5B9GrJ9RPWC+c7epf6tspY50wtVSJo
         tG7HM4EJwSYmxLn4zZkcaY4tF/KgzQVgUB7sr1hczF3iInxCnkoC9gDMR24lvaWgMCc8
         G5AFD72dnTbXKYDPl9oEqJYE8JNNOaXO6SVLh/LqQUxuWHqwKoPnAH/lQQBxgfmy3KU9
         jig0xvAdoOzb2Yk3ieCf61We+2J9001UIPgrUYTwd+/0rZrxGnjR7a18suRPnaeNmxfE
         OH1F1JUHR9OSY08mO7nXA0+ODNzRZea24aehhSk5x2LSXnvJ8OC2t2pZMd0Gb2StIJI+
         067Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765844022; x=1766448822;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJXH/uiRoHhuih5/I2ODx7WhEy17OS2PU1TLwkzpYUE=;
        b=nZi5pXQsulNNxPW2AasUeXvpy1CMSx8/1tVqCOx1sW/PMcLn+qkS0b5eO3u7nMgaqQ
         Wzk8W7ZBqp4+1HUZO+Hlmhs2JP0Cllup3J2vT85NTFL3SdsZIfF/g9eYasJ3vHU9fjGX
         YlTOopW9cbNpxRGRvp75m+o/SRlDZS4za08EWS752F3ioo+aMzmaDrCgRzFB0YKbOPYN
         Afnc/1GG0hTWMmXn3q7VvumAMennZrQsR5aH4W15OSPVMZRRWgeDwM7q/c0JB6C1dYgy
         n7BAcYt0DRdTYnwlRTCHjICwggxbAaCHtupctHQ7A+rXmbLV2AvlEBWk4niE5qGsBADk
         ejZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4juV6VT1EuM1JcYAB4w6UyTb+wqv3QEQa7RRvOHnLGdgmR7+PggvHZQdXjSdOxt48iO/lRTfjoPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVikFjpcad6auVKARsOvi8a2VmtUhWmQvgkG9Ifgs+/eH5L/5n
	EhqtDK2+IT5N6xRC/wGMbbxZiDdhbrnW5hkC+idtrMPfNnfcBKqkI0ZTeQuiFVvb/X4=
X-Gm-Gg: AY/fxX5RM5LhPFxKcCEBOADolT82R3DWhJpxOr6FiQg1n8/DHuJDuasPzZyPWN+ID0c
	fm4gKTChjUZDE83bZBjruZe7nCGjeLwBG6SgwDxCCEwdgIDycT+cD/IKrow1+dKrcIZsbyMT1ZD
	dUz1/IuppAxYvuDRqP+IFFm7grb7EePT/BB4q1LVYMJuz5/GbaXDo/zKsC1GtF861sOBeawTH9m
	hJukAAYDyL3WcV8LVkk35VwXv0Q64zTV5NjZ23NE0CksNwGBbd6ZsYZ6ol1w0ZjqFhoVnEWLkyM
	eXsYEdW9+tGUtJ3Lh3s56Hb09wsGmUfi/B3nNNORFpPxlmE6zUzrT4Zm+nipfO7iT5ss/EkbCoV
	yjIeapcHw/z6ePjyJT5AspTgrl4AWiuDKb/03yBvlKADDDnfDAyhSjmcSoxPGODmFpkeusqrgR1
	JNm8OOV6K3ukg=
X-Google-Smtp-Source: AGHT+IEYHxljoowlccUR3ZGnI0jRpnLa3q1pwIE+8h2j0uQOtBvo2oRc6kvkq5/jnfF3cQXciNwmiw==
X-Received: by 2002:a17:902:f691:b0:2a0:cb8d:2ed6 with SMTP id d9443c01a7336-2a0cb8d3232mr55756685ad.51.1765844022398;
        Mon, 15 Dec 2025 16:13:42 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0bb39db53sm61431625ad.11.2025.12.15.16.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 16:13:41 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6914940B7D27; Tue, 16 Dec 2025 07:13:39 +0700 (WIB)
Date: Tue, 16 Dec 2025 07:13:39 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Virtualization <virtualization@lists.linux.dev>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: kernel-doc comment with anonymous macro?
Message-ID: <aUCkM-lRUmIMAh6N@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ePZY92H6X+PJnKhA"
Content-Disposition: inline


--ePZY92H6X+PJnKhA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

=2E/scripts/kernel-doc reports warning on include/linux/virtio.h:

Info: include/linux/virtio.h:16 Scanning doc for struct virtqueue
Info: include/linux/virtio.h:139 Scanning doc for struct virtio_device
Warning: include/linux/virtio.h:183 struct member 'VIRTIO_DECLARE_FEATURES(=
features' not described in 'virtio_device'
Info: include/linux/virtio.h:217 Scanning doc for struct virtio_driver
Warning: include/linux/virtio.h:183 struct member 'VIRTIO_DECLARE_FEATURES(=
features' not described in 'virtio_device'
1 errors

struct virtio_device is defined as:

struct virtio_device {
	int index;
	bool failed;
	bool config_core_enabled;
	bool config_driver_disabled;
	bool config_change_pending;
	spinlock_t config_lock;
	spinlock_t vqs_list_lock;
	struct device dev;
	struct virtio_device_id id;
	const struct virtio_config_ops *config;
	const struct vringh_config_ops *vringh_config;
	const struct virtio_map_ops *map;
	struct list_head vqs;
	VIRTIO_DECLARE_FEATURES(features);
	void *priv;
	union virtio_map vmap;
#ifdef CONFIG_VIRTIO_DEBUG
	struct dentry *debugfs_dir;
	u64 debugfs_filter_features[VIRTIO_FEATURES_U64S];
#endif
};

where VIRTIO_DECLARE_FEATURES() is an anonymous macro.

What can I do to fix the warning?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ePZY92H6X+PJnKhA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaUCkLwAKCRD2uYlJVVFO
o08dAQDbC7alvU33oTxteMC8zuSbEpk8Mo09KJzmJO79S9BT7QD/QR5gP7Iu+J7Z
A6NJ/m764eLB+H1ZShwy14XdcZI+aQg=
=XdjH
-----END PGP SIGNATURE-----

--ePZY92H6X+PJnKhA--
