Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E482C41518
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E60CD60241
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580434AbhCBSD0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Mar 2021 13:03:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349788AbhCBRga (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 12:36:30 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDC4C0698C2
        for <linux-doc@vger.kernel.org>; Tue,  2 Mar 2021 09:20:43 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id b21so14263862pgk.7
        for <linux-doc@vger.kernel.org>; Tue, 02 Mar 2021 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cilium-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AThU4ci48FKxy/EX8TQpAEHDA9i5ZmNT/rLJMEkkHrM=;
        b=TRm4JPuM3dS20NhEZWk7JIzebqcxaxAjsqGFS5zL6ZusSg7H37Xa9iJXZUODP5okvA
         6EmC7Quu6NbpvlZkJaKrXaJ6/2CjePLiQ0qMKsn8zWq3Q8tJHswz6F27RSKKdXbkzzTO
         Ep4Y7DkVGYZMmgeSu0Td4gmz0LOW47iLVUEjQm+k1Gc/T9Copy63Uypd9NGe+yRaM/bp
         In/0+dZQluaotcyb3QizHyPqAxNGb7zCYx+BpVIxaU60BL2Ti1HzaiAHeXbrgZAIjScu
         4NhIu9uS709nR1F2IUkI3AJd75vakacFjFq9BXXSDE7PjlXLBe4WynJBe6jgxcKZcee4
         FW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AThU4ci48FKxy/EX8TQpAEHDA9i5ZmNT/rLJMEkkHrM=;
        b=GHjsn7XVnOr0yRWTXXOR7CAbusOOUeRXNLls/8JfdPP47Rrr+k7uawT7KHWJu5cnBW
         Rz92KI/2hBbwKHLUVLRLRFd5Ci+JrTc4WdW1E8jva/zUZqrMet+ivZptg9bhOWdDgYSC
         V1jwDGHyW481K5eWZrulLR96Fu3eV1kZWc1dZkMIhXSVu4xUaykgqohMReYipQ8MNHEW
         gJlPEJtATB6ENzGlGQGiTqvh6ahD/dNKgU9hC9n8iUcl7Cos/8mEhggqM6Tg63RdfGWo
         7WdPWVGAXfsHlsd83LahCVALXAE2JCiJMziw8ArRXpNWafYcXgmexqBXIDJqQLY2cdKV
         mxTA==
X-Gm-Message-State: AOAM5319KFeAaklNywVMtw49ZJ/OvP/Kq3mUzhCy67UQHqSAtsYfk8Ey
        Yeqy9FDZjTkvELEuspKIHjsTRQ==
X-Google-Smtp-Source: ABdhPJzzVSbAzyjYnnbzdMLtBDQGJaOL0r5I5Nr5cA2wEk7ykjzOznxcSdJydzJkbN2d2iEG3ly2ng==
X-Received: by 2002:a62:4e92:0:b029:1ee:251d:50a1 with SMTP id c140-20020a624e920000b02901ee251d50a1mr4010269pfb.53.1614705642736;
        Tue, 02 Mar 2021 09:20:42 -0800 (PST)
Received: from localhost.localdomain (c-73-93-5-123.hsd1.ca.comcast.net. [73.93.5.123])
        by smtp.gmail.com with ESMTPSA id b15sm20073923pgg.85.2021.03.02.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:20:42 -0800 (PST)
From:   Joe Stringer <joe@cilium.io>
To:     bpf@vger.kernel.org
Cc:     daniel@iogearbox.net, ast@kernel.org, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Quentin Monnet <quentin@isovalent.com>,
        Brian Vazquez <brianvv@google.com>, Yonghong Song <yhs@fb.com>
Subject: [PATCHv2 bpf-next 08/15] bpf: Document BPF_MAP_*_BATCH syscall commands
Date:   Tue,  2 Mar 2021 09:19:40 -0800
Message-Id: <20210302171947.2268128-9-joe@cilium.io>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302171947.2268128-1-joe@cilium.io>
References: <20210302171947.2268128-1-joe@cilium.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Based roughly on the following commits:
* Commit cb4d03ab499d ("bpf: Add generic support for lookup batch op")
* Commit 057996380a42 ("bpf: Add batch ops to all htab bpf map")
* Commit aa2e93b8e58e ("bpf: Add generic support for update and delete
  batch ops")

Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>
Reviewed-by: Quentin Monnet <quentin@isovalent.com>
Signed-off-by: Joe Stringer <joe@cilium.io>
---
CC: Brian Vazquez <brianvv@google.com>
CC: Yonghong Song <yhs@fb.com>
---
 include/uapi/linux/bpf.h | 114 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 111 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 0cf92ef011f1..c8b9d19fce22 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -553,13 +553,55 @@ union bpf_iter_link_info {
  *	Description
  *		Iterate and fetch multiple elements in a map.
  *
+ *		Two opaque values are used to manage batch operations,
+ *		*in_batch* and *out_batch*. Initially, *in_batch* must be set
+ *		to NULL to begin the batched operation. After each subsequent
+ *		**BPF_MAP_LOOKUP_BATCH**, the caller should pass the resultant
+ *		*out_batch* as the *in_batch* for the next operation to
+ *		continue iteration from the current point.
+ *
+ *		The *keys* and *values* are output parameters which must point
+ *		to memory large enough to hold *count* items based on the key
+ *		and value size of the map *map_fd*. The *keys* buffer must be
+ *		of *key_size* * *count*. The *values* buffer must be of
+ *		*value_size* * *count*.
+ *
+ *		The *elem_flags* argument may be specified as one of the
+ *		following:
+ *
+ *		**BPF_F_LOCK**
+ *			Look up the value of a spin-locked map without
+ *			returning the lock. This must be specified if the
+ *			elements contain a spinlock.
+ *
+ *		On success, *count* elements from the map are copied into the
+ *		user buffer, with the keys copied into *keys* and the values
+ *		copied into the corresponding indices in *values*.
+ *
+ *		If an error is returned and *errno* is not **EFAULT**, *count*
+ *		is set to the number of successfully processed elements.
+ *
  *	Return
  *		Returns zero on success. On error, -1 is returned and *errno*
  *		is set appropriately.
  *
+ *		May set *errno* to **ENOSPC** to indicate that *keys* or
+ *		*values* is too small to dump an entire bucket during
+ *		iteration of a hash-based map type.
+ *
  * BPF_MAP_LOOKUP_AND_DELETE_BATCH
  *	Description
- *		Iterate and delete multiple elements in a map.
+ *		Iterate and delete all elements in a map.
+ *
+ *		This operation has the same behavior as
+ *		**BPF_MAP_LOOKUP_BATCH** with two exceptions:
+ *
+ *		* Every element that is successfully returned is also deleted
+ *		  from the map. This is at least *count* elements. Note that
+ *		  *count* is both an input and an output parameter.
+ *		* Upon returning with *errno* set to **EFAULT**, up to
+ *		  *count* elements may be deleted without returning the keys
+ *		  and values of the deleted elements.
  *
  *	Return
  *		Returns zero on success. On error, -1 is returned and *errno*
@@ -567,15 +609,81 @@ union bpf_iter_link_info {
  *
  * BPF_MAP_UPDATE_BATCH
  *	Description
- *		Iterate and update multiple elements in a map.
+ *		Update multiple elements in a map by *key*.
+ *
+ *		The *keys* and *values* are input parameters which must point
+ *		to memory large enough to hold *count* items based on the key
+ *		and value size of the map *map_fd*. The *keys* buffer must be
+ *		of *key_size* * *count*. The *values* buffer must be of
+ *		*value_size* * *count*.
+ *
+ *		Each element specified in *keys* is sequentially updated to the
+ *		value in the corresponding index in *values*. The *in_batch*
+ *		and *out_batch* parameters are ignored and should be zeroed.
+ *
+ *		The *elem_flags* argument should be specified as one of the
+ *		following:
+ *
+ *		**BPF_ANY**
+ *			Create new elements or update a existing elements.
+ *		**BPF_NOEXIST**
+ *			Create new elements only if they do not exist.
+ *		**BPF_EXIST**
+ *			Update existing elements.
+ *		**BPF_F_LOCK**
+ *			Update spin_lock-ed map elements. This must be
+ *			specified if the map value contains a spinlock.
+ *
+ *		On success, *count* elements from the map are updated.
+ *
+ *		If an error is returned and *errno* is not **EFAULT**, *count*
+ *		is set to the number of successfully processed elements.
  *
  *	Return
  *		Returns zero on success. On error, -1 is returned and *errno*
  *		is set appropriately.
  *
+ *		May set *errno* to **EINVAL**, **EPERM**, **ENOMEM**, or
+ *		**E2BIG**. **E2BIG** indicates that the number of elements in
+ *		the map reached the *max_entries* limit specified at map
+ *		creation time.
+ *
+ *		May set *errno* to one of the following error codes under
+ *		specific circumstances:
+ *
+ *		**EEXIST**
+ *			If *flags* specifies **BPF_NOEXIST** and the element
+ *			with *key* already exists in the map.
+ *		**ENOENT**
+ *			If *flags* specifies **BPF_EXIST** and the element with
+ *			*key* does not exist in the map.
+ *
  * BPF_MAP_DELETE_BATCH
  *	Description
- *		Iterate and delete multiple elements in a map.
+ *		Delete multiple elements in a map by *key*.
+ *
+ *		The *keys* parameter is an input parameter which must point
+ *		to memory large enough to hold *count* items based on the key
+ *		size of the map *map_fd*, that is, *key_size* * *count*.
+ *
+ *		Each element specified in *keys* is sequentially deleted. The
+ *		*in_batch*, *out_batch*, and *values* parameters are ignored
+ *		and should be zeroed.
+ *
+ *		The *elem_flags* argument may be specified as one of the
+ *		following:
+ *
+ *		**BPF_F_LOCK**
+ *			Look up the value of a spin-locked map without
+ *			returning the lock. This must be specified if the
+ *			elements contain a spinlock.
+ *
+ *		On success, *count* elements from the map are updated.
+ *
+ *		If an error is returned and *errno* is not **EFAULT**, *count*
+ *		is set to the number of successfully processed elements. If
+ *		*errno* is **EFAULT**, up to *count* elements may be been
+ *		deleted.
  *
  *	Return
  *		Returns zero on success. On error, -1 is returned and *errno*
-- 
2.27.0

