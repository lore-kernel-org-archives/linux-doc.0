Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426892;
	b=CS6tr44ICFakqCU+3rMHLKjIj1QFGm/WxqsAZi5i/Nz+Uk+HJ1EXuF3kTCXbrkaAfBbE
	 /RAi6P0gO/cZ/NrGsVaF/AX6p6VWuXamwM1ygKohVi846m42MQT8Cipw35+tjut4ZhHQs
	 ZqwGZ8glv2exQUpSoww8OAfF7MV/FSwwsX425pBi8g2MIG1etXdMhAse2WpxLUDZn8+Vx
	 ucIfLnlthRpeOH4VPMs+f+qQJVcaM9/QYrXEhiZDYcI1LwdK/6fjeS5Qx4M1LStA1qI7Q
	 bCVa1nU3LE4fHvW2dtfFyLtWwaKYHHJmtOR5A4SGdyjnowiPtNfL7z9ImcYhGHwSCfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426892;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=GHs0/gDr8EptH4dRJZ9/o18rXIjU8lVzShf3k6REhvo=;
	b=TJ+0S1QGZQKPt6mefma82nxSAtf3kPpRVyQouIwgt610tv/0OVymDXEJk6m2q7oaynn7
	 pmGfX3b2cNXLGB+TLD7Xgr0im9jQi8zNuuP+pGi319BNDoXXn5R62mq5kvAO88O1fmtLV
	 Iklyl7afHLShhzHPogSWs8qLvfErJkN5W8/3mb5Xd05dJ6zA26YPGsxPF1J/kNUayYYdE
	 5IIHnFaYIXS1JXwztEdsiQhp4a9Kolxoux7Gp9gQ5sPVGVR7PGNeCS4QlfLgaCFBhQoMh
	 upGTVt9CIMC+RdHQgYn+uwdNs4UVOa5xTB+g6OOv2J4MMX/4d7MJnEwcXxF9bKri83Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XwO+6cb9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IPKp3SdH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E9606A334
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 16:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84E9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XwO+6cb9;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IPKp3SdH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792426890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHs0/gDr8EptH4dRJZ9/o18rXIjU8lVzShf3k6REhvo=;
	b=XwO+6cb9Sptnbl7631rt17+tRZpGZVBF6lqS1aZNbucQLV1huClFfupL///ScAmqrN66rX
	5lSXMd8rH0ty3WBRHRDRz9UUfxxeokVmXxr+baZdNJGrKodCbJREOBNG+BIUHknF0PDs5L
	VTz1zbSWAk1zFMMBG1+gh9s3gAhtXeA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-TltxK3PnPvukt7xMZC9NPw-1; Mon, 19 Oct 2026 16:21:20 +0000
X-MC-Unique: TltxK3PnPvukt7xMZC9NPw-1
X-Mimecast-MFC-AGG-ID: TltxK3PnPvukt7xMZC9NPw_1792426879
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so544920285a.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792426879; x=1793031679; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GHs0/gDr8EptH4dRJZ9/o18rXIjU8lVzShf3k6REhvo=;
        b=IPKp3SdHzNcMMUFRjMN0z4IjBKdz185MM/ojfsCW0G0I56u/5CoIiVm0Rj7KseYb7f
         06/jK+4EMISm/kY+7CkORTxSVPRjTKD+DVinUZo+zwvH5vvBIK5AGjceiR3oUrGb+TXi
         okDRqcxvfHFkZfrNAlwLgFYSVnCaEVco0O3mZnpFcrIEaUiQme5bso73uj/x1ykiZ4VE
         ZzhEFpfpFjOmpb77TN7cG7DM4h6MRn5x+WsgdWdTHAoReWv3EtflVi+NboGCedgwJ3TE
         cc9Wu6Mjg1yiE7mhQ+ghSG0CibLSl/c97ZiAngnVz+WxR7cq0d2RNmXElwQ2OtCqMgOP
         tgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426879; x=1793031679;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHs0/gDr8EptH4dRJZ9/o18rXIjU8lVzShf3k6REhvo=;
        b=yeNCKMethtqmxpP6zuW5cunmPJi/3i9WGt3Hu1I9dhQbvnZhmWE9G4Ck3w5o21kDy4
         To6peYLqivUmQ5Oj32Z2K7gI5N4oHOXvFSyV51BYMNB5mHODD3SvKU7/CLjdjyuA2mNC
         761MGgd4ejSVGQBJM92x/ussciPfnl7gyiVAi1jDAHXeCCgs8P4fMyYy2e4NV2CT9ZCt
         7YI3S5Av+aZal+7X5XGwQvsZtIQuTlOQJ4BMHGxBnC5/kBNVm8shrnFnG+uXYcRKhx8t
         SOCgXsu9JaRkYnWc/Ttz4Ov19BvycvFaTywEddHKyvH8bhrZ8HBCvKkJ9e/NhG8klX+p
         wfrg==
X-Forwarded-Encrypted: i=1; AKwUvBwXdSRwkNmuRzR0zJbPeEByXJA6ik0YPoda7wrA1OCQCXV+lUZYfTPwAjEHvvhVGGe8D5mH4ROPbHk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgeZYqXbldIFFmhxnC9naDN5gjQzrMO93B47/l7k1vOZdcWjVI
	HO+GDsQB62GtL9F0Ph4/sqgvXuRZ6MXzCL8ATlx0rFjM1yhXUHybEsIbdO6N3bZOYdor6BCAova
	2A4AZENTDKRKWzSa7k/ZQsZGtxJEpDCSMxi3a2XV+uLmEZzyRkhwFgk4wnWfUeA==
X-Gm-Gg: AYBFou1JxwLuSGXxjyBS+w/GE5BgMUBz+ysHIF4p63NMoPi1rGjhgHjeMMIq0RGzqWQ
	Dq6Tte5bCeTbRUIJRQVaOqmWc9d+Y1A5olztaPSenTi8h7fvf60H9R++w5mEjxQQVsF0QlP8lko
	F1Sz7deBVxkYPBGf8+niUBmhtp8o5uV9clI/UX86VFyd8ru+tKXh1k8dtuTszXAFGlov2iqiqt9
	AfKCp64N2CPgyuTVCQGy5/rsIRnZ9V2pRRBgZtJDnkHsSgBoAsu+mrAdvu5NH5fYd4DBVlWHcSh
	ZCncQB+0QuOv6XbOKpBpADa/GtLaxIJvOE0XzyiapvYcMuBaJqpz9ZuFZOvB+9Pv7Wj+4Wg=
X-Received: by 2002:a05:620a:1a17:b0:93f:1ed3:a9d6 with SMTP id af79cd13be357-93f29d39476mr1436079085a.38.1792426879069;
        Mon, 19 Oct 2026 09:21:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93f:1ed3:a9d6 with SMTP id af79cd13be357-93f29d39476mr1436073785a.38.1792426878408;
        Mon, 19 Oct 2026 09:21:18 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a17f226sm998258985a.17.2026.10.19.09.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:21:17 -0700 (PDT)
Message-ID: <f89d8c26ea178cc326aeda2d43d1a27a8f8d0e8b.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Lorenzo Stoakes
 (ARM)" <ljs@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	federico.vaga@vaga.pv.it, apw@canonical.com, joe@perches.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Linus Torvalds
 <torvalds@linux-foundation.org>, Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino	 <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jori
 Koolstra	 <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig	 <hch@infradead.org>, David Disseldorp <ddiss@suse.de>,
 Mark Brown	 <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Jens
 Axboe	 <axboe@kernel.dk>, "David Hildenbrand (Arm)" <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)"
 <brauner@kernel.org>
Date: Mon, 19 Oct 2026 12:21:16 -0400
In-Reply-To: <20261013131243.GM56180@killaraus.ideasonboard.com>
References: <20261009083137.3-1-sashal@kernel.org>
	 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
	 <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-13 at 15:12 +0200, Laurent Pinchart wrote:
> How do you decide which patches to ignore ?

Seriously.

There isn't a little slop icon that comes with a slop submission,
people actually have to sit down and take time to read through it
before determining whether or not to ignore it.

If people are ignoring patches without even reading them, that's going
to be a serious issue that is going to lock a lot of well meaning new
contributors out. We already have a tremendous issue in multiple
subsystems with maintainers being able to keep up with workloads, the
issue that should be getting solved here is being -more clear- about
how an LLM was used so that people who aren't just copying code
straight from their chat bot don't need to tag things.

