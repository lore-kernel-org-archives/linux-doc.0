Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B271737FF54
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 23:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781481065; cv=none; b=CCYQkKH75GCk8cdZer2nYP0rkLNuqMA4iPVdXcd8ItU7y0a9QjuCjUVfI9BkyQlufqBrVXNUizSVw3LKufjZq9JRZRntw5Kt+meJCF/Z1oUScn3ZwzbSWb4DM+9VLOqgV+1z25cc8bGTDN6YHY7jP2rmXp/GptGHuBBxxFsRKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781481065; c=relaxed/simple;
	bh=i38F7jpguMjczztO95+CzmqhADyNIhJu+zd7DEXFano=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aBkURdTMKuV+nTmUIFxMvpFPpx8ZMLoyI5rHXzQwRYTZkGUVWgw+MrhlgSc/VR2OcCwMV8Hws+p6sK7ln5GPrMrdE7oky0c2n8Fyw7KkEL3YV9tAFntr+AJpmvAJXyetyV8S5XquZuqnae6kqvg4Tx4JXQcwCbhsGYXNE1SfZm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liFGYXiQ; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liFGYXiQ"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso1006816e0c.0
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 16:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781481063; x=1782085863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNd1mTmS3WOPR3+vXPubCLGAjkjoWTV/vXWyrQNlXKg=;
        b=liFGYXiQkLlHf0bHE2YXqnmd3bdtYI+mn6YTh28Tk2snKYwYL7a8Cu2GZqQ2PrSq9A
         sunK8f8VHDeBLbsM+LxzhHXAG90VxdKc+F2+Jfn3wMAWwz0h1gRc7sjassUn4fVUMmvn
         6onrUrL4BALnW8id+IKMrzE+0keL0VkVjsHtWr58gzkcgYy+RVkyPC+IJ+RmBFFCspoZ
         9BA30iypM20+UX4ycLduZNUEmvYLog4bTIIQxtlqXTKJel43Zw4NKTybi398r/rA9ntV
         zTzsxYSfqNHM5qB7d3h0iM7F0R9eJd8dhknnFRWYiGw/eXLV03Fse5BbUEeMboFeHsSa
         QamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781481063; x=1782085863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNd1mTmS3WOPR3+vXPubCLGAjkjoWTV/vXWyrQNlXKg=;
        b=JrP5L41AY7jPzxGQ1jnQ8LorsHOFxzW8LasB5qDYRN58oIA3YpF0cHDrdeSORClOjc
         9Oml9GlFBTI0DBEl510SLLC1KT/gMgl+SB5v5eEgM0nk/bb0GXmj5qF7AhzD54IZZbV2
         6q92SfRY7XvsNYaO9RTkF6JuOFjjJcxaajgOpzuPLyKh+9bNMsNk6ber5lz7bymhvJQD
         tqYICSau1Uq/IZugcZv+pOc4y3i8CJvCqTBFSjVWgRrYJGTWMmpsrYfpRA4rGkVCObEi
         ePJ4pMzZZiAAXVMK9UyUdI1962Eq+BeLbO3/qDcAU8OI1DAYMp6otLhbTqidWVarFbuN
         O88Q==
X-Gm-Message-State: AOJu0YzKhX6x9UONpcpAOaRb+GKqlwz9k1IwdnGNcJWzaOhdtwxBN/mJ
	p27ifrlf7TAdb3o0VgRsRCckdIOdMjW7GXgRaIABlJCnjQpVqSpGSXQs
X-Gm-Gg: Acq92OGUayXrfoN+OwxEBNcb7KKI8mA2yfy6QXMKdXYy365YHZz1lxWxprTf1oRztBz
	B8PyQDbb3wt8aWp3zqGQhRIj6r1QaQXurIeof8d5b6bSV/um/eEK+uVrpBI6UHE+MOu2cOvAunt
	qp2nnTvcUO8aSNuGmK1EXJOIQX+JSD8og746Af0NRJfg6J/iE1Zwuz0znpNz0zj4ylxRvak9vuG
	cZ6LMz3HzjAMp/xzz9A4O+brBd/umAnmwg/cuR0zghIW5/Fz2f9Wi/drlL6VZukDhcFoiv90yUp
	g/MFuv3oktArB5XjAY6sa6PLLAKbYO7nIm1JQxyihCKRPutXVfYBv/ATD7011OAPqilbtK9e1I0
	bd+BoviRDM6tEVGE8i9fjXq2q32kdEOWYR7Wf0saLMb9DYAUHugojo3dQdC6RMtcV14ZgGwuffw
	QCPdrbTsbG12s8LKtICk/qQNyxYU1CQyWbs/GRtXjyVx/oA/Pa41vb4wEe78/EBy35Z+DsvQxMJ
	Hzz7eG4zg==
X-Received: by 2002:a05:6102:f88:b0:62e:c54:fccb with SMTP id ada2fe7eead31-71e88e043b5mr6127481137.28.1781481063563;
        Sun, 14 Jun 2026 16:51:03 -0700 (PDT)
Received: from localhost.localdomain ([177.75.70.24])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7208788587esm1630195137.10.2026.06.14.16.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 16:51:03 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 0/2] docs: pt_BR: Translate coding and posting guidelines
Date: Sun, 14 Jun 2026 20:50:39 -0300
Message-ID: <20260614235044.42810-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series translates chapters 4 and 5 of the kernel development
process documentation ("4.Coding.rst" and "5.Posting.rst") into 
Brazilian Portuguese (pt_BR).

The goal is to expand the available documentation for Portuguese-speaking
developers, making it easier to understand core coding standards and
patch submission guidelines.

Daniel Pereira (2):
  docs: pt_BR: Translate 4.coding.rst into Portuguese
  docs: pt_BR: Translate patch posting documentation

 .../translations/pt_BR/process/4.Coding.rst   | 440 ++++++++++++++++++
 .../translations/pt_BR/process/5.Posting.rst  | 376 +++++++++++++++
 .../pt_BR/process/development-process.rst     |   2 +
 3 files changed, 818 insertions(+)
 create mode 100644 Documentation/translations/pt_BR/process/4.Coding.rst
 create mode 100644 Documentation/translations/pt_BR/process/5.Posting.rst

-- 
2.47.3

