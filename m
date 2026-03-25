Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6038F25F
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 23:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482764; cv=none; b=NSVQkOlAkDojbukGR/EtRXwX7e8o1cVxLr/mGXePu2N72OW8G8+9Pwfx7v4lBae1ZWOqkwUFAX5/+tgD7YdYB3GecXGjP3IV6Ks6qsiF+H9KhvsB1yqLo8avgfR+mqHwGo0b2yfkgAj6PsJV4mP4Ubm+4qhos3N/ITUAfgE+LeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482764; c=relaxed/simple;
	bh=pDlL9CglIFwRMO2//WwSLnjr7T4jqi7GVAwBYo3zUck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RCKF7ZgsswHf/nQgeRX55ZE5lS/pKSffhURjyH+ZLzguOMBsgPBuojCHmLl0yb3iIn3TaBVqxY7riuEmHoSWy8Wu1z94d75hfz3CNyXjsRPFNfbKj7lor/bhga776dk/s64FryCVUFFVKxA/27BDhS9AapDsQMe/wjdNLKJi2Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zz6Gtbv3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cQ6K1kzS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zz6Gtbv3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cQ6K1kzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774482761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yuJFXc+oSvSHiNWcGKsTw0+QoEJBqEFxVNPR1gcgJbM=;
	b=Zz6Gtbv3sBozsI2/X8mvsRyQxlaPg8fa4u0Yh7gGZv4hPc2bi3edaGvgPsBReWytq7ECp7
	IDpXR3tHI3Ezrjb8XkYKiNgM53CfiHwiZ2LfSar8rYiT4pgn7bsExKzWrmhMf/Mj0MEzc7
	ChJ3ACduOR3XMVqokNyJUCW7+Zv6n9c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643--kkKWcnkMIWXWpgvNevuNQ-1; Wed, 25 Mar 2026 19:52:40 -0400
X-MC-Unique: -kkKWcnkMIWXWpgvNevuNQ-1
X-Mimecast-MFC-AGG-ID: -kkKWcnkMIWXWpgvNevuNQ_1774482760
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7c4ab845so140846985a.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 16:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774482760; x=1775087560; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuJFXc+oSvSHiNWcGKsTw0+QoEJBqEFxVNPR1gcgJbM=;
        b=cQ6K1kzSgy6+Pde3JMLbR+DEDzVoMPT1prAP5K2+Q67HfT18WBd15NH0chfkRsGst3
         /vzpzMRKtPY1V56zPv8NRBKdUPZpdviOUeaq5Z7inGVHXLBbOug1hysQ4f+dh2uTmTzY
         ZEt2wqyIS+5oMqr/nY+oPbPDVsF7GhmuE9ZOXs6h586ktjmutuNs+nApUs6ZCcwGYghe
         iX8pq1db4tRK93BVJqnY9j6cMRA/3aJbDU68WbPkxDzY9FQ19GaMcrj19slNCy9pHXew
         /+995YU19vpzmQxpFpeG0Fz0l0BozIEEzZMGI+eHOcnwoYiT2y1DMLekKezVQSQ21wVF
         WfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482760; x=1775087560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuJFXc+oSvSHiNWcGKsTw0+QoEJBqEFxVNPR1gcgJbM=;
        b=GzVDwsHMUAwlU4OS6wh62an/ufv3pWeRX+HLh1f5rWHjZRPlM2gZwcL3vb7CfOYpfQ
         vAtOApTUumcdbzyWRNHbScvo1456G7yM3M8GfPE3IPq7MgZ1+Wf2WENGluQxLA5XgXmf
         MlLekYQUsllnnBPGcN8AVHgzvIQ3vyexoljlHLrUJJ7GewVeQhRynmO23qaWaSps8A3i
         Lh+UZia/P+QhZMl7Mv5VBWQqZoO2ihUNkOI04MGNMdNW22xgFgaxxJdn0QIjh77gRjGy
         SfzXLgNSu9CRCyVqjR/FMBMEu/8/fdt+Pj9GdsMt+mVsO1BMbppFimue9UK2WJXvKuwU
         VSkw==
X-Forwarded-Encrypted: i=1; AJvYcCVPOsC1Anwd1Ry3FG2DwPT7eu8uRXCkudjWh3ZTzRIzFyZ85x7CF3/nBTU/5g3qqEV+3E9wCNnIcIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGE2J2BZpu5ljERWUAcnLqHR2iaG2/Pcj1ZGU1+AZhlLFQonrQ
	Lz9lNTZeChC7Cdbs0NWVQj14KE4X0IXPI2JA9tFo+F0U4bJsBhIQdyS2rAYTfu/Id0lPQ8sE5ot
	iwN74WDvj6EhygE42bvmgXRAR/n6j+VcNGNa58Lu13i//4NyVC/IzAqgEeym7IQ==
X-Gm-Gg: ATEYQzxJvzTLgzJZa4BxNyYb5eD4aaXqshEMMNVsH2uhH385zx5YO0JmZXHXZEnkPP5
	JstfMk1IKDoZqP5cCT14eEJjieK6CY8nfhA5FLcFdJlBPGlUffM9KvIoMjAfwyRULjRHZANriV2
	aodd39eA32YbwSs8PQAKQ/0DItCtL6hptDPcmaUkGWMwJP+bqqFhbxCv1wzbcsC8GDP45pdIuvt
	0lhiOKa/mJgBl6bnQTxR390yy/iORuOtNT14VHoul67ekhMCzJ0hgWqg7bSiOwjXRVJb52B5ZRd
	4OfUbaZGgRaPVhYUS2HaEoVz+U0ya/H/3spzH0Z1dpkgkkVspzTY9ffkOeGWuYylAGecEuY3rSK
	8nZRluo3By1yrub6ORMuaxH5OPtv9Tl4nzWq7+LsaR5/WfqeHgW4P4XgAz7Tc
X-Received: by 2002:a05:620a:1708:b0:8cf:be85:ba84 with SMTP id af79cd13be357-8d00107923fmr778027185a.54.1774482759951;
        Wed, 25 Mar 2026 16:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1708:b0:8cf:be85:ba84 with SMTP id af79cd13be357-8d00107923fmr778024085a.54.1774482759430;
        Wed, 25 Mar 2026 16:52:39 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e501eedsm106346785a.40.2026.03.25.16.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:52:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/4] clk: update kernel docs
Date: Wed, 25 Mar 2026 19:52:09 -0400
Message-Id: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQ7CIBCF4as0s3bMgIitK+9humhhEKIWA02ja
 bi72LXL/+XlWyFzCpzh3KyQeAk5xKmG3DVg/DDdGIOtDZKkpgMpNI872mgy0ng8tU5JoYmg3l+
 JXXhv1LWv7UOeY/ps8iJ+6x9kEUjomJVu7dh1TlwSWz/MexOf0JdSvh4f6YuhAAAA
X-Change-ID: 20260304-clk-docs-0b578f421600
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pDlL9CglIFwRMO2//WwSLnjr7T4jqi7GVAwBYo3zUck=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKPlFo5/vZZuG+mk1PKvYgrl3X/XDn3f2vjybkxZ+tnn
 FZQf6Fq01HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBENvEyMnSd2xG4cIsok6FS
 pEK0S/KyA7ITX1b7r++ecmNv/6FlKzcwMkwXEzkyV31+S2zVzYBbjDqb3jxwuXrIh2GTYi2r3eb
 E2dwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a small series that updates the kernel documentation for struct
clk_core, moves the clk flags into a new enum so that they can be shown
in the documentation, and updates the clk kunit test to use HZ_PER_MHZ.

Since I've been doing a lot of work in the clk subsystem lately, I would
like to add some more documentation about this subsystem in the future
as I have time. There's a lot of other things that I know can be done
now, and I'd like to just start with these small changes merged.

Changes in v2:
- Add clk_core_flags enum, and kernel doc for this.
- Update descriptions in clk_core based on feedback from Stephen.
- Update clk kernel docs to show some of the new API documentation.
- Link to v1: https://lore.kernel.org/r/20260304-clk-docs-v1-0-fee468db99f1@redhat.com

Merge Strategy
--------------
Since there is a new enum that's added, and it's referenced in the
docoumentation, all of these patches will need to go through Stephen's
tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      clk: move core flags into a new enum for kernel docs
      clk: add kernel docs for struct clk_core
      docs: clk: include some identifiers to keep documentation up to date
      clk: test: convert constants to use HZ_PER_MHZ

 Documentation/driver-api/clk.rst | 58 +++++++---------------------------------
 drivers/clk/clk.c                | 51 +++++++++++++++++++++++++++++++++++
 drivers/clk/clk_test.c           |  7 ++---
 include/linux/clk-provider.h     | 55 ++++++++++++++++++++++---------------
 4 files changed, 98 insertions(+), 73 deletions(-)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260304-clk-docs-0b578f421600

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

