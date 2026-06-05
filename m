Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C923D413F
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780702621; cv=none; b=LAZlBnXD8f6Dc2ojLblqA2i7G+Qjx3Hs5Q/GjMM5h2u5mMElX5P5IDJr67jJGSB+uYo236nmjfz5rUlIx2Jo82SIhCf/fG56c6gwyYT8ogD2FtI0D6iKB54m3JTDEaLC0eHDiV661imK0C8O/3vRnCbDVx6yk2v9ZdqifpS79hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780702621; c=relaxed/simple;
	bh=neSocN6TVKBA4t2f9Vylz4lp+6WndAneTxpc6BpvXCA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BwzJYdcu/niLhn5/RlJvhF1T4LlFmTqs4S5KrDVD+4l6WxH1dPRdssGdJyiw8Z/cLBOpSISXzcK+Jjw4yRnQMXZyMArxm87Tc0HbuamHnifLwHqn31uV1a8ekzsVo5xYzSyCYdK7rbRfnWQC5zSdmbB9dF2+iwE1ReXzlMscIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NYwbYczf; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NYwbYczf"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-304ea1eea05so4887230eec.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780702619; x=1781307419; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UFvPWrQD/AjvIlGDL+q8aROizOfdZdfW4UIDnk6moas=;
        b=NYwbYczfg/RTU0jPcb80YucAkFuDc1HbnFkSf3ON9QPyNL+QZTK0zsbTQGrwdA9xy7
         f2veMaY6dAIOJZprZ8Pw1OzUMDIF/HuNmtQhccuqs1FryyQzWJ0gmaVi2AQxLSds6Gv1
         lg/H98gcU7f+R7IKal24RXyPbOEIYHUPcfnvVmFR8Ou3faYZihKf0i4LFZ8BN3xdhvGG
         gpyva12Uaf63GkU9UBfT3W0HCxRKA0sqrFyeQcXidszQgYdNeVMt1zGEcrTutNYeueZ7
         769ezJ5O66gTO0OMcIJfxcL5o9w6m1pBYvFR5NfMwphb9I4KXY5ASjwuTDSgXCNxHolR
         oUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780702619; x=1781307419;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFvPWrQD/AjvIlGDL+q8aROizOfdZdfW4UIDnk6moas=;
        b=c0tSdvJB+LXRkmXu9offauACFfboI9LhL09IFY9gF0WoF0VIBsOW5yJNzdyw++hTt3
         cApWPsoLznRxdhkL0zXbEn03D1aTWpjr7yk3sxZmx+G5CpHHT+M2cUz7vnkxQZ6XpIUj
         IqulNpQJOic+CzejxQS2itrqRUG1PG+Lz5n0IHCfKlfH0M6MdND7DhTKO6imRZIkGy0r
         9DhkhiBjQTHzPkAPxvURqcewSuhGmqVOcqTm/wE57crKZEMO/isdOAYvkx4k61fcIe6O
         y4unXXP5siTyg47cyiSpl6XjdqAk9Spinbkkx/oN54UaqjnY/+8tenMnKAp4FdZr2m9g
         galQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xmQsPKm3Upgtr4wc+W37cNtEmOVfl7Lv22IPfI9dLmk1gk9EUILownQ4i+VMHxCTWGNcV9U1SESk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/55QUs+VNGY6ELe4IQHSAytpfAISk/Rh2wjCa02bzZvCD1+dy
	oOthv/3Uyg4SJ0kSwhLuD+dyJZdleLfhiDgkQ5YVVgW9KuG23AtSIw63hJAVnvHZkYM7ubrdbSO
	m0/+IBKS2YYocMtyTcjB+8ThK3yHyRFMd/g==
X-Received: from dyvs26.prod.google.com ([2002:a05:693c:42da:b0:304:cda1:27ce])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:572a:b0:304:aca:35c5 with SMTP id 5a478bee46e88-3077b22c938mr2897763eec.23.1780702618822;
 Fri, 05 Jun 2026 16:36:58 -0700 (PDT)
Date: Fri,  5 Jun 2026 23:36:49 +0000
In-Reply-To: <cover.1780701922.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <b608a6f7d71e3b728f766dbc6dfa1d1753ddcff5.1780701922.git.abhishekbapat@google.com>
Subject: [PATCH v3 4/6] alloc_tag: add accuracy based filtering to ioctl
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
 include/uapi/linux/alloc_tag.h | 3 +++
 lib/alloc_tag.c                | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 0e648192df4d..42445bdb11c5 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -20,6 +20,7 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	__u64 inaccurate;
 };
 
 /* The alignment ensures 32-bit compatible interfaces are not broken */
@@ -39,6 +40,7 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
+	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
 	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -48,6 +50,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index ddc6946f56ab..cbcd12c4ef9c 100644
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
 
@@ -275,6 +277,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
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
2.54.0.1032.g2f8565e1d1-goog

