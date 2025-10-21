Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CF8333733
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 12:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051580; cv=none; b=qNfAcsyQUVLUo3ct5cKSlpGOzpmnLZ5ayGVsgYoyQ5pfPlXYdFsM3yi5qDxRmdOeaXSBKL+inddwEhPXZLwCtB3kDCsyb2rmHZKxieP/MTx9Y14LQWshcsDIG+AWGPM1+ctcGGL6MVtk3mxK52zNrLfoC04h3gSP7ABBRWvfklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051580; c=relaxed/simple;
	bh=uLM2aZ8rWOYNYhXo8M9ClKVdKdX3HbPbC0z5JcD2olA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGTV/B0InZg7vmh7RAs0CqGblGIlk2AXn33dzE0Dro8ZiUN4zKfAPaSIRulUld1giilrEPwh8j+w/I4s/521G6BGZuI3lbYUEU+D1j2x2+AMvZbRcLQ1dGmFFAUAqC+SkpE3r6lR9Lv9Ady5k128yTqi/boZyRZW3IU1HMlMRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XVwYabna; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XVwYabna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJ8O3oI3PxPdSYdHMVP+xUJdXO9FbTcv+rg9gD/qHfE=;
	b=XVwYabnaErXgWIP7f1P8n3a9dhLltrX9jIdiL8gZDVYTPLZXfNzQC4tEhQb2cg7cTwZHE4
	RDkpCadSLE9JQFnb5CFuHeeYM7DAB+gA5tfBLxNVrdkDwFtuc5g8DYKseqBT6pmNknhFr8
	4RRM2z21FqS8RSUUc+d9OZctM0mifUQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-Yd91E6eiMZiaXmL9o0bBEg-1; Tue, 21 Oct 2025 08:59:36 -0400
X-MC-Unique: Yd91E6eiMZiaXmL9o0bBEg-1
X-Mimecast-MFC-AGG-ID: Yd91E6eiMZiaXmL9o0bBEg_1761051575
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-426d4f59cbcso3474042f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 05:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051575; x=1761656375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJ8O3oI3PxPdSYdHMVP+xUJdXO9FbTcv+rg9gD/qHfE=;
        b=qvE2Q3V4QiNXpjeCXTG/bGt/VqOcqu2UvahLMKG3zuhgx2DwYYww/lp0BVPGcyktZl
         It7oyw4uZcIE5WgHcAV04qrf7jKx+bcpx9q2Xxz77oHA96O2c6msPzh3khXJX0Pznkoh
         f22aXcTqd57ebUlpGVsdchTIR/ssew/9vY6QNz0v+eC7fpdVIHGr2WsgevAHo/asoBrA
         853tFjMmhIMHBdIBeADA2rZzAfTAEB7a7mCQGBEH0Id8LNMH2o8d+/e8IzCoI4auYl4e
         NVlj9BWgyDgI/xFCvuU7sO41wijU+Jsskhkc7z+iXmcEgeqZyEQawfXoyPn1NbOq7XQj
         HUqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbcFGDR+fg2I/2rxjaW0BfxLz847tD5QTtAJAasaBXlvylvfxIfIqG8hQPHiVDIBoJGj+zhOjjP5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9LmGEeu37vV35Lo/5cLf4az/VZ7rKWdU2e+h0p1sHcok53Cmt
	1p0R7KabpZyPZXNvAYOlQHgQPzTr952naTiO1LKy+ZknbKVfCaw59S/6xTs0FXIcFVvmcJ6mBP9
	g2OV3npvDjABtZUvtfKT2gm2dmPcKbebRcMy5UcLOIspySHzsEPxwagmDlQX5Ug==
X-Gm-Gg: ASbGncuh05ADvW4bpkNTAuvwtmV0Ae7WG2KiaWxc1R1MtOspi6tIB+z2v1PyWOQuoit
	8DKawfDCiF3roiixfuekL6CVmipgSIyaJ9oKp6MdLk45bM7BXcGS4ck0SLmfviuKRSNfvkdHOAH
	N79cu8+ukKc+V+jUKwiQUPQNlGfIeGCH7cQKavHxNAGx8a2vtk5nqmP9Gv+i7XGmcEWtrm2idtF
	ogP32Sau8mNnJpqKZ43KzgrWmeWl/Y3uJeEkSfU3kNy9KMryMJTZEnPpUeSwc4IVWtIs8jzaJAW
	Qd56/4y6wRF7Wn6M/trxxL3ebaBUkRglGHwkpB1B0SUgsHNZpPuMmQJgz5EVDcy64qXEUZXEGwz
	QHTCtnmf9QpGPtX9J/d/yY2nl1I6K1dWC6xuLh7qfb7B7q+yNK3pJ1wMGMNcu
X-Received: by 2002:a05:6000:2287:b0:425:7e33:b4a9 with SMTP id ffacd0b85a97d-42704a62705mr14069853f8f.0.1761051574820;
        Tue, 21 Oct 2025 05:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECa0A/SeCpIiHVmJluGV/YpnUcjGB4T+0tmg/6h2iDdcNEnR83hKR+rxH2jY97xv4J3P/Z8A==
X-Received: by 2002:a05:6000:2287:b0:425:7e33:b4a9 with SMTP id ffacd0b85a97d-42704a62705mr14069824f8f.0.1761051574412;
        Tue, 21 Oct 2025 05:59:34 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ba01bsm19979250f8f.41.2025.10.21.05.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:33 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 01/23] vmw_balloon: adjust BALLOON_DEFLATE when deflating while migrating
Date: Tue, 21 Oct 2025 14:59:06 +0200
Message-ID: <20251021125929.377194-2-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we're effectively deflating the balloon while migrating a page
because inflating the new page failed, we're not adjusting
BALLOON_DEFLATE.

Let's do that. This is a preparation for factoring out this handling to
the core code, making it work in a similar way first.

As this (deflating while migrating because of inflation error) is a
corner case that I don't really expect to happen in practice
and the stats are not that crucial, this likely doesn't classify as a fix.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/misc/vmw_balloon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index cc1d18b3df5ca..2cc34c4968fac 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -1818,6 +1818,8 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
 	if (status == VMW_BALLOON_SUCCESS) {
 		balloon_page_insert(&b->b_dev_info, newpage);
 		__count_vm_event(BALLOON_MIGRATE);
+	} else {
+		__count_vm_event(BALLOON_DEFLATE);
 	}
 
 	/*
-- 
2.51.0

