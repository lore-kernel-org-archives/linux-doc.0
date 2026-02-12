Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A135B642
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 12:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900602; cv=none; b=WtfbClXcSMPtKy+jk92ZH3FlLtxG5+M/4MJ71P3fyTH+N7g0A0zkE7Knk4Glw4A5kOVdI2vSeWj6o8qpUPWyNiuG1SrEBpLjc32lnDsEinCT78eN3zSFqtBtmYhNcBgkz7zLaFCtrIgEXNix6T7cyIqR8Tum4ReYmw9OxizSLu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900602; c=relaxed/simple;
	bh=i8y4+3Sp3icY6F5xOj5JtI88J55J3GW9AFTWjOzEfqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTZfz+1RrRj18ZDRq4kA/3DcngdC/E2MCs6bvnVoRiwTl5L1y8zRJv3nBIxOQVIOYriO51bX2ZKWyZfVS9u63Ch3G8XgZQ5FoT6n9aFePR3MLL18Cs7aa9pW9VAmaxsVYK+bPhweJ59UBsrPU5+7yfJSN9zaY7/wJ3JjssC/TCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KxZxLy6P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KxZxLy6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770900600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/FMz5x4DmdZtabmz3VNxJ7E7VlcqQfXAznqr1KFH7q0=;
	b=KxZxLy6P8nYg+zck+gwne2/rY+s7lfsIPQ5MpFWlqrZcXOaj8qiqSea5rUHGem5OJT/KIX
	5IRz8Nvaix/xsTNRU4LvmNtxqf78q0pXsYN2dfDXzO7QEgJkYPDoefM9X53IZNBWhoiThj
	neGLdydWFfg6035UJY5rvICYd32kQME=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-wNNyPXEiNCqNcE7X1lGA4w-1; Thu,
 12 Feb 2026 07:49:57 -0500
X-MC-Unique: wNNyPXEiNCqNcE7X1lGA4w-1
X-Mimecast-MFC-AGG-ID: wNNyPXEiNCqNcE7X1lGA4w_1770900595
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60EE0195605A;
	Thu, 12 Feb 2026 12:49:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.22.11])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE2D030001B9;
	Thu, 12 Feb 2026 12:49:49 +0000 (UTC)
From: Gabriele Paoloni <gpaoloni@redhat.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	brendan.higgins@linux.dev,
	raemoar63@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: acarminati@nvidia.com,
	linux-mm@kvack.org,
	safety-architecture@lists.elisa.tech,
	kstewart@linuxfoundation.org,
	chuckwolber@gmail.com,
	gpaoloni@redhat.com,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [RFC PATCH v3 3/6] kunit: add visibility helpers for static inline functions
Date: Thu, 12 Feb 2026 13:49:20 +0100
Message-ID: <20260212124923.222484-4-gpaoloni@redhat.com>
In-Reply-To: <20260212124923.222484-1-gpaoloni@redhat.com>
References: <20260212124923.222484-1-gpaoloni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Alessandro Carminati <acarmina@redhat.com>

Add KUnit visibility helpers for static inline functions so they can be
referenced by test code when KUnit is enabled.

This change does not alter behavior or expose new functionality at
runtime; it only provides a mechanism to override visibility for
testing purposes.

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 include/kunit/visibility.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/kunit/visibility.h b/include/kunit/visibility.h
index 7c34c8ffcf3b..82ab7fffc943 100644
--- a/include/kunit/visibility.h
+++ b/include/kunit/visibility.h
@@ -17,6 +17,7 @@
      * there is no change to the symbol definition.
      */
     #define VISIBLE_IF_KUNIT
+    #define INLINE_VISIBLE_IF_KUNIT
     /**
      * EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
      * EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is
@@ -27,6 +28,7 @@
     #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, "EXPORTED_FOR_KUNIT_TESTING")
 #else
     #define VISIBLE_IF_KUNIT static
+    #define INLINE_VISIBLE_IF_KUNIT static inline
     #define EXPORT_SYMBOL_IF_KUNIT(symbol)
 #endif
 
-- 
2.48.1

