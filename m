Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D454369A
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781050394; cv=none; b=KT0EF7UHB5ZB9AmfplHOBL6QWHLNbrW00yzgBAcJIXFdIssnhcYFCpezfJihdXNiRrTFVJD19jJB5fK3KpZnUeLX0Tg3eDT5YIV7clmywFqf71zBk9+H2gbERojywgVaEz/D6m5P52mfxQz78R8E8LyvAPZWDr8P2DzJPQMBA00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781050394; c=relaxed/simple;
	bh=2F4bd5gtwgtf5S4NAHS/fmmXGiRksDRvErNcvp7U2WM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kgbh+UnovqZq0GJ3LU+nv4pZeYz5uCYLm5R61+/tiAiIcW50pjPTawsAc7rEfDPZ13qAjWnvKEDzosPHBDvHSGandxMLDKL4rVd2fC9OWUcVJOI5vK/1OkRJF1+m4eMkiEOzbzWAbgheezFyhWZnvYtqapL5ZI81sL2reJc2E/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ai58Gfj1; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ai58Gfj1"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-304e7fc90b1so6242606eec.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 17:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781050393; x=1781655193; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHbnDTTx4SUTRx8/0+aZqHaMkKtJnoW/wRc2CebNntU=;
        b=ai58Gfj1z0luwGZHdj5PtYzoOt8M5SjWNneG1/qdbYo6LzMWT8tAExtQ+QVDi2jbOh
         BURAfB65G1/St8+Jlserz7Q8vz6GvkD/8p/8q+zwAIHiixFQCTiMIFVcqASrtSuHZjwi
         62bhrbfjmeeKdVaqhtPZi0HK+7uFgM0HymFqNKeZdRvd9I2sPKUPcPq92Gdq9YeQpzdT
         YE5K67sJMuZBoL3AMCevhdwhPOA8GnIHJW2euA3Ga2gwxkqltbKMgZxKJxqGtszyeJIX
         hCzEXwclZiTAl23W/9eQwfcKz9QnAITCIZ2vAZtvKPvbP6RpRuC6THSmQylWQMOAhIP7
         a6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781050393; x=1781655193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHbnDTTx4SUTRx8/0+aZqHaMkKtJnoW/wRc2CebNntU=;
        b=IbGCTnDd10jabkUuJUGFX4QYMljLppYh6PJaKTV9+euZmUJu0ksyQP/gqUpa3XMt3r
         H+CqbaW2nmE0sg04RXNl2SsZHPtqbxyp0FKsbKjpoKS1oPAWQWg32h9xiUfhPlEyNKEk
         dxPImlbGvJKrQ1zhSjpMHRkR5oaw+EJHAzWNf1HvBOwXvoWeVbxIh2yqRvqxIYvTvXL/
         0vDLPbS6QD4Imm8bkRe9IV60MLxlrN3oAp9WDn5Cq4nQfBRZGK/AmTO5dc+dKmvK2jqZ
         ehxZRJXRGM9a4LlUrlDKli69wj9PDPKmfnjRvf+THgluj3fJY4HqR3H+qMqSBFthivEs
         0e2g==
X-Forwarded-Encrypted: i=1; AFNElJ/8pPgEGQVtAuKOVemVkVXI8U6/o+KRlVBy/4CP2QtnrwqLO5INkMNzbPyNGv5kI/oHD/qJvlUsNkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9RbV2JeFqz/P4CFjB0jTQrhFJUwKu3WT5VhK7PD0+lI6j7klm
	xT88QZmMaTI7MI6og6TyoAlIx1rY+/jkbzwthA9fAf2CrvEqiTcRE+KqsJpDRGgHV7i6YPBfRzQ
	q2xMAoaFf7NvlHYof1x2HdW2TiCuMmb6H+w==
X-Received: from dyba14.prod.google.com ([2002:a05:693c:63ce:b0:2f4:b34a:2550])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:9bc1:b0:2ff:c611:82c7 with SMTP id 5a478bee46e88-3077b0847camr13528502eec.12.1781050392582;
 Tue, 09 Jun 2026 17:13:12 -0700 (PDT)
Date: Wed, 10 Jun 2026 00:12:57 +0000
In-Reply-To: <cover.1781042698.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781042698.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <7f3a4ddb3f132464f17716eaae657a6367d6dd05.1781042698.git.abhishekbapat@google.com>
Subject: [PATCH v4 4/6] alloc_tag: add accuracy based filtering to ioctl
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the allocinfo filtering mechanism to allow users to filter tags
based on their accuracy.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
---
 include/uapi/linux/alloc_tag.h | 4 ++++
 lib/alloc_tag.c                | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 7f5acbb44c14..6ea39c4869fe 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -26,6 +26,8 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
+	__u64 inaccurate;
 };
 
 /* The alignment ensures 32-bit compatible interfaces are not broken */
@@ -45,6 +47,7 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
+	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
 	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -54,6 +57,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index a936cf18611a..73fb3d0ab821 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			   struct alloc_tag_counters *counters,
 			   bool *fetched_counters)
 {
+	bool inaccurate;
+
 	if (!filter || !filter->mask)
 		return true;
 
@@ -274,6 +276,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 	    ct->lineno != filter->fields.lineno)
 		return false;
 
+	if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
+		inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
+		if (inaccurate != !!(filter->fields.inaccurate))
+			return false;
+	}
+
 	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
 		if (!*fetched_counters) {
 			*counters = allocinfo_prefetch_counters(ct);
-- 
2.54.0.1099.g489fc7bff1-goog

