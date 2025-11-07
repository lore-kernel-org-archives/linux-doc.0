Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ED821FF3B
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 05:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762493409; cv=none; b=nPnTSQP0z3dasZywkJQ4IrnZ+S5vjugkm4hGsvu9fgOa+yywYRwc02d+6nL4VFOJEHACUKMtoNDyUml5vWZyjB589GEaIkayeMUPoF4VVu7eL3fQSs5xN2+MmVjRG5D+3ADYDmmudtubBydukdHrNg8nSv3TGHGT/+iXus/q6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762493409; c=relaxed/simple;
	bh=Gfa74bvT8g21TTG6UeYJUX49YlH6I28Q/5rLnsXNtu4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WyWKeTf1Nu6EhpL+2uFuw4fZGvRXOSYoplvtYMgKF00rOlxfIY+zDQA602fxx3RvRqomi5264FoxUSLjwKMkAKCX43Uj5nWUegHtLrgvE2WBUcaO3IIPzu6/J08RNhYyp1AhPzzii6VO4ywVlHgpCKwIjqD8j7hN/vVdElTfwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pX9UZxxf; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pX9UZxxf"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-76c0ad16289so4419517b3.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 21:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762493406; x=1763098206; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gxyC8GUOhbymd0hZW1Wc7AlwN6X8GVnWJwQLTO+kr4=;
        b=pX9UZxxfciYzQ1uFrIh/3etkrl0QEdGhu3g5Ea3xruo1GWh/xrdLebeOn5l12kmhpm
         OBuuIUQkzgo4/DkewT8+ykCE0tNkxCjSHfyhT9Br0aVGcfdyyrc2JPSjcfGEBBLdzqme
         9SGz1/fFLrN/GqENL4xakl1BNwwFsvJkF1+TNYsxmSD7juRN+p9dTFHz++QW0EtmRLsd
         0S8IY8z2b6PArlfsWHkhWy5gn2YsUt9n8cPk/3DLaBpa77G3glj7VJIMh/Nst4CIwXDw
         O7xnkm31OroAtg7HKG2tVdpp5x3PbDveHlCl+1CA6Cq2qn3FrNyeISHhb1anp5VX1Hpv
         /BxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762493406; x=1763098206;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gxyC8GUOhbymd0hZW1Wc7AlwN6X8GVnWJwQLTO+kr4=;
        b=jQdi8+fPFf/S6NlwXFHuMdPwYvskgeklGg9t1hFXkD/hfZlTjNuOYI631zUzkVeLL+
         zupnQFH2pxyEv3i+UiNJoKCtv/Ok+J2V9SKKr1w7nZ2kiB6ABzWOfKj+QYb+bq4nf+E/
         N6PPnvgCu76eGIh67Ndo8eEqZKNjBcLSpfF4thE6QqsFYG1gL6/wn5djriRERO4bvQZ1
         KdXvmatGbHmdb7muUjPjwJmDrSvbVqnrdEEzqVmTe7KGjc9C84cHQKo5YfdyMEUYh+Lw
         24wFssS85qmj3PTRh+VevXNLLhaDABvMu27uhFGbWgGCSulEQ+byQ31FYmFRZv3kfPxs
         2JvA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Qx+z42O5mz7iBn9mWa7H2vXwW+OFr68fnK88tgt4BnR5yy3SAMqsl1JVJ72o8sAjntQu7YdNQKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YymsD9Wd3tYdtnsJAKR/loOCBL7uikLcDsrmoRtpIUGyAjWCHH4
	rxdB4hN53LPbQMYkmCut+JN+uzKU6te9H66j6u3q4QBJA4HtyJUOeuYEPE1Lue4UCr5SkEnZxr8
	99Q==
X-Google-Smtp-Source: AGHT+IFyTML4kwjlT8XJq9ynWGzbE9ai1eUBXHm+9uVGmQAwTAKz9Wy9ddid4pLEgQKt5V9M2r2fUt9K2g==
X-Received: from ywbkl8.prod.google.com ([2002:a05:690c:5048:b0:784:9edd:65d8])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:f89:b0:787:c612:f0f6
 with SMTP id 00721157ae682-787c61305eamr15892597b3.1.1762493406390; Thu, 06
 Nov 2025 21:30:06 -0800 (PST)
Date: Fri,  7 Nov 2025 05:29:26 +0000
In-Reply-To: <20251107052926.3403265-1-rmoar@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251107052926.3403265-1-rmoar@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107052926.3403265-6-rmoar@google.com>
Subject: [PATCH RESEND 5/5] ktap_v2: change version to 2 in KTAP specification
From: Rae Moar <rmoar@google.com>
To: frowand.list@gmail.com, davidgow@google.com, keescook@chromium.org, 
	raemoar63@gmail.com, Tim.Bird@sony.com, shuah@kernel.org
Cc: tytso@google.com, gustavo.padovan@collabora.com, 
	ricardo.canuelo@collabora.com, corbet@lwn.net, kernelci@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

Prepare KTAP specification for the final release of version 2 by
removing "-rc" in the title. This would previously cause a Sphinx
warning.

This series represents the final version of KTAP version 2 that includes
the major addition of test metadata.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/ktap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index d118119910f8..1abb30887008 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 ===================================================
-The Kernel Test Anything Protocol (KTAP), version 2-rc
+The Kernel Test Anything Protocol (KTAP), version 2
 ===================================================
 
 TAP, or the Test Anything Protocol is a format for specifying test results used
-- 
2.51.2.1041.gc1ab5b90ca-goog

