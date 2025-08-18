Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786EF226CE5
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510486; cv=none; b=g6U2+UuTwsCOi/Wil7OhERafxcAF1UHa9Vuc5XgqOxsDSZxSKOV66srJn8izs/oNdc5FJiE2MHWiHmfC53YwQgCqFD//Pwo2doF666J9z477hilnMDtMY83YpIpxuTI0NJBTKLSZ4rVYLOkssXeRzYR27C9+9tQ6k0aDlKksN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510486; c=relaxed/simple;
	bh=z0Y5zlKyq1iyjTdrH5tIm8cQtHMJc2M8Qax87gsnJ9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=uu4IhSSMe7fIU/d+8IqIjzzaeVw7rUuUhg5O24EMqx7ndtb5onXK2GZ+sWoweag22fu5heqAUh23n9BLePPJE99H1Z//ujNvNyYTAMBe4xa0qQ6VBZTkqos78To/NhLfLwYkvEhS9P/f/JgwW4dNMilhO/OaiIw4dSO9FLUgVpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=owo.li; spf=pass smtp.mailfrom=owo.li; dkim=pass (2048-bit key) header.d=owo.li header.i=@owo.li header.b=O6Qt4cqR; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=owo.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=owo.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=owo.li header.i=@owo.li header.b="O6Qt4cqR"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2e60433eso2873840b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=owo.li; s=google; t=1755510484; x=1756115284; darn=vger.kernel.org;
        h=mime-version:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bxXt0HrR/xsywipkhm+/TKQI7O+RQHahjEth/TvbAXA=;
        b=O6Qt4cqRkCnN+lrIgKTA1xdboUVE1Cf39VE0kPsHMaFfqYEqyDPUZPLaPVg1B+ozM6
         EaqcDItl6mIGBqir8/lMsvdDa5GxAnuEssAYtepYfWchVgr4zSuhF9H/B1BAXcodR3tD
         2vKrPbxXBg9LZFP8cNTlVclKNsldTS6WNlC5mJ0pkZnPGbfBSVArOp66967ypko9kEe/
         uv+dCcJWWvTd2BbczJpt1Gjx7GammvpPxxnqaebB9aIbvrIedIxJW5qIxlW7A7m/CJ4y
         BgtoSixqaKZyDUU2eyXYuP0jJHKAfzQMkBlTSo88hKRVLUcCW8BZfpkUwkxu2XeII+K/
         gzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510484; x=1756115284;
        h=mime-version:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxXt0HrR/xsywipkhm+/TKQI7O+RQHahjEth/TvbAXA=;
        b=HURXChfqlGkamacZ2ZOJ8JBFofUg66ll51ewC7SXL15dF3VEmMyL0fIhWxZ0u3gSrj
         /Qqx5h0IRtksq4g8Dt6wqaabBHJojs0cBqr4Vr+4muurhgX50iWwT4nZyx/mYCYD4nm5
         C1Bvfv28f5Acgt54pfPEcJYfWYiqCkZrGmjTsfyGYbE3xhkYEZgVUM+hwO8yl8Xr3zik
         oOB2G0q2CrEAjhWu0h548Yt3Q7NvywOSPPazF2b0XZEtDrVSjXHwB2KYwo9Fd2LkBjki
         gowNIVzfeTu2qFjPjEhqK0l+4VaNlvqxjvbBmGsEBOL0lsuchN4nx77c1l2dGgbvP7cj
         vlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYVevnzH3f2Kyeq4TSOeodZSqEEYX5uFfYJCnB7lvZUD9MaMryM/bHQrocOa/ilnZhKdz7lE4VftY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybCoeVSqnQSlhCpwq2G6dNeFP+b7aJ+8/kxgY+7uCXTq/yRpkd
	EkQ14pnvq6XMIr28mpUvjJOjJsYCh1rSdygwCYvQfbig6sb6z0l0pfHOPa804OLILIM=
X-Gm-Gg: ASbGncuH00VyDXHyVoBU2COqmxj4jzTXBfnseCegoy67fdl9YWWA+TvyzKMnyzuUo9I
	VOsjI6I4C47Kd5YsUT1oFnWSpUEF6+khNiZ02z9QPZjU477A9MfiPeJhcLOuZEJEwrehq4JyuUY
	PAWBae0/Y2v3ySS4chKMlaq+hnZNc06BkI8dup5m7oMuypCSWDuY0g5MggXThpAlKKCpeO+ZnSf
	d4+wLfHhmk+j9ISqLvy23VOSssG3ZQ0Tma2TZTxZHGVdv2N+2kJuYv1Mpzk2Ym78+4eYGQUAKxl
	GuYI+D4mn5pphNklZ6QG3EYqCr2T/+cMtOc1DiHlTwe7sPpMdI/GQeNz96Ptd4plY8IohoP6hup
	qGXZFCkY5Cknj
X-Google-Smtp-Source: AGHT+IHLlw/No5aFyj88EmI3LVwF09WQd0xKKENW6U+K7hMbKaPgJph2PKeZJwvSaWehvHET7VDF1w==
X-Received: by 2002:a05:6a00:21d6:b0:76b:da70:487b with SMTP id d2e1a72fcca58-76e447bf8f4mr14007768b3a.15.1755510483798;
        Mon, 18 Aug 2025 02:48:03 -0700 (PDT)
Received: from Iris-s-laptop ([103.143.92.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45565da9sm6703596b3a.60.2025.08.18.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:48:02 -0700 (PDT)
Date: Mon, 18 Aug 2025 17:47:48 +0800 (+08)
From: Iris Shi <0.0@owo.li>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/sphinx: Fix typo in automarkup.py
Message-ID: <8e5ddb7d-8faf-314f-b1b1-2d15d6900862@owo.li>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

"whan" -> "when"

Signed-off-by: Iris Shi <0.0@owo.li>
---
 Documentation/sphinx/automarkup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 563033f764bb..1d9dada40a74 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -244,7 +244,7 @@ def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
     return contnode
 
 #
-# Variant of markup_abi_ref() that warns whan a reference is not found
+# Variant of markup_abi_ref() that warns when a reference is not found
 #
 def markup_abi_file_ref(docname, app, match):
     return markup_abi_ref(docname, app, match, warning=True)
-- 
2.50.1


