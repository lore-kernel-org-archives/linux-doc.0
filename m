Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33362853F7
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 05:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762493395; cv=none; b=NXk7oWVvHuOkG7DhkZyuFYpPM1Ncinqogz+gYq8H5jGqO3+EIw4XSSuqlebXc8k/57HydazD4qSRaKsf2a2xlTXIHaTIQ/7ZlvBMufjSIgbjwBMdV8MNm2iSNqwIGqeHsPq5emPYjsLi9jBKoZxtyjjD5KlamfRtUnYLXpjGYO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762493395; c=relaxed/simple;
	bh=L03uIXQZxdkalVh9ZjTUCdHmAeF5s/msBRS6xoMrnQ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=REEbyvqvPjoFGDd7Ig/tqVPaplDjleq0s9t/Oh+ctqDt/R0C6FeSRaFvryA1OsjFHYyg2shLFL7DMAAAVKef/PaiTNDOgVRvHgkCaKCvMkQI/pYOe7UOI9j1OXs1sJWqvnDpXR9XcLZkdDXO06E6kiVzSUEHfD8j89uQ0lmRisY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qnNGK6qS; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qnNGK6qS"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-891504015e5so95705885a.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 21:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762493393; x=1763098193; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=48j2zZJXWTS3tXcJmxqzEPrxFj/EkmhfLmBq2HSrPzY=;
        b=qnNGK6qSyezrQlCnKtwoFClcO+0ve8xEyIYiT37Xqn5AtoSKQ4xjxYR+V0QwJMKHJX
         f/fxqFjucLqBCwon9vb8xkI6hdey2LllJns8QdwTATb2p7ZiWlpEMtEIA65JEUhqqbZE
         5BnHCr5WNsYndgHpAQaidxqu711zSMav58/TSwxweL2J35/jo+7Y8FdTUCleZThR1qOU
         S+dYEqQD611rWvYCgQt2zDKdKkHeA+duvmSL8ZQBtOGfdZRZPHVyltEIDSWRIQvhSQId
         DuvP7LqdyjsxPS6CmgMHsqoIB+oN8EWwngfox46w3H+tow9a56kpQVL8fBKpg8QPwAXD
         lpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762493393; x=1763098193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48j2zZJXWTS3tXcJmxqzEPrxFj/EkmhfLmBq2HSrPzY=;
        b=Q/tSoxWKO2edR555bQK6AVRb3nIpXzzqBXd7SopdNOG6Oe+PXcAL+wi2+1vXKITslZ
         y9gi42L0Cb2IXXktJqHS7x/IdOPur30kutHZOF8aeCWGzucYCtlAa4PmNgl85XfMQQKb
         R6Fzuo7XLlOdEv9HkS6a2Si+rsekWvxa/lcqFcZChUdf2S+sMKgWlciIOGV6WRW1J1Ja
         llvO8DPskZlLgC/2Dgz3eerde+q+DVBrJ7IcS3SLadjA6rFbs2dt78G6ITHmRNJjw23R
         hJ94rh3djd0eEu+oNRDL52AYSkAbnTp/OO6SDWTS9AQ/krEjQo/y02qydnPk6uMfvxEL
         zp7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGqQGWFn6KUf11DXva7IzA+Hz3xJdvLmPq+ioiZKyPwmuopPIQnJKq5OgcYkwVxxIv2CQlBPoIZv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX7z4TwhAQY4NFwA7FY70f0VT8jmHzfo+kEZ7utPcAEUZcHmpt
	6uIUQqHcxI1b1l7yF7haVaHDvIvvUwUYG+eqUJsincDssX4aqup7GV0F6k5rJIouJ5EZgVEfkrt
	mMg==
X-Google-Smtp-Source: AGHT+IGX6OEfniAXqNWEIhp2i9gcLVm92VZiRnkK4/N6XrrlWlAs+epPZsQEP+HqeKvwBATh/hbqJHdIFw==
X-Received: from qkoz12.prod.google.com ([2002:a05:620a:260c:b0:899:fd6d:28b0])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:318c:b0:84d:9f49:6898
 with SMTP id af79cd13be357-8b245351d7emr265794885a.61.1762493392688; Thu, 06
 Nov 2025 21:29:52 -0800 (PST)
Date: Fri,  7 Nov 2025 05:29:22 +0000
In-Reply-To: <20251107052926.3403265-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251107052926.3403265-1-rmoar@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107052926.3403265-2-rmoar@google.com>
Subject: [PATCH RESEND 1/5] ktap_v2: change version to 2-rc in KTAP specification
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	raemoar63@gmail.com, Tim.Bird@sony.com, shuah@kernel.org
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frank Rowand <frank.rowand@sony.com>, Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Frank Rowand <frank.rowand@sony.com>

Prepare KTAP Specification for the process of creating version 2.

The version will remain "2-rc" until the final commit to complete
Version 2.  Adding the "-rc" ensures that none of the development
versions will be mistaken for the completed version 2.

After this commit, Sphinx complains that we now need more '=' signs:

  Documentation/dev-tools/ktap.rst:3: WARNING: Title overline too short.
  ===================================================
  The Kernel Test Anything Protocol (KTAP), version 2-rc
  ===================================================

This warning will disappear in the final commit for the release of
version 2, when the "-rc" is removed.

Reviewed-by: Rae Moar <rmoar@google.com>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index a9810bed5fd4..387062b96c10 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 ===================================================
-The Kernel Test Anything Protocol (KTAP), version 1
+The Kernel Test Anything Protocol (KTAP), version 2-rc
 ===================================================
 
 TAP, or the Test Anything Protocol is a format for specifying test results used
-- 
2.51.2.1041.gc1ab5b90ca-goog

