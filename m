Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE34EBAE4
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 23:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791935165; cv=none; b=Z+TzaoJmoHkfzuAmngpZ9s5u6WWnwSfNbnluMUrnVTjJ0ylRD2HpNO/22DtlIxaj+/rYzsdONS4u8WghMcuM9KDJRZq6OHLAI9rFWR/i2qCka6WKTHF0Z+6Mdf/YJcb1kQ+COEEmzRvkYM1WVTIJOkVTkdQZCK4BgS7fXt62CA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791935165; c=relaxed/simple;
	bh=EF1LwZgsRUIQrMk58WlWcF6iwwhWYa8WlARUbB+A+bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lAvxZg273IDhAojqdMminnk/ou2Tp4VXP7NkjMB9J2piO+5wiSvrB97igu95uv1cYUjqkUWHKXbZnYqi/GNlu85mAlbR02lIUsjHC6M+1J3bZfzesLcOGehLj2AJdaaYwWdl1sbTzTlJKtFUo5LRFKagjWMVhOsxAqSUPB0a0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAPxqzRf; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAPxqzRf"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so613380c88.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 16:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791935163; x=1792539963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mlGpR6PaTM65eNVl7gc4MS45jtMlIfk6O582kNDMHoU=;
        b=UAPxqzRfngdFnqKUneC7o9i7TIMielfstdt8lIk5PYKT9lUEXMiJXSmVsgUASQAyki
         HYl56GB6ZrbIRe8Ci5UXH5SAzLidLXbfRakjIQ9/IuNTVFqMi4c+MRf7MxHEoqV2qHo6
         yJMrntgiQ8FTwsZxAJclDjFZLMpQZcx4Byff8A1B/8y3uWsbqvgAIobEbJH9HU+6jqZh
         2OgTsa/mSQch91hh0zye4w9cgSspE7M79TVf7EbFAODbwtimq39GLnY99rCTA5JrzkcI
         eokjgz1IBpBMHf23E+BHkfdhv2d6ShmGoCrXQd6cT1qHry1Luj2uha3KyjY4U/qDIwMt
         0gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791935163; x=1792539963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mlGpR6PaTM65eNVl7gc4MS45jtMlIfk6O582kNDMHoU=;
        b=1qLfAsY8FzR6pwIyFA+wgWjacy81mlLilfsunSCSj/65Ur8bA40bihwCkFAm74f78X
         R80D3h7Pp971BvA9jQIDb1KqluezFJYYWk6d7UoJc3DKK2tmVXw8qBNIIPTki25G1X5n
         r21zlIYuC4kmoo999iiQ6zaFkcC2j9eIRzNxE618QJYUbnmxw1Ys6+lp4YSW1SnxMDFe
         5ZkSrWcpirCjz0uAsjHGv/DxqTKD00FR2TcMMS1NcdJf7EHJd+AXGFqRcC0v8+eoxymR
         AqUp5lT1MrSwkn8w0qleQylzfYdVDGjkt59BGTmlPi+JjKWmyjIUYVnrRPnidS+hNOfy
         q/Eg==
X-Forwarded-Encrypted: i=1; AKwUvBxncJx2CZXE63Y8dAD/eXWEO7nmN5WgujMJ4VJfs5Q3OvjpIPsDQGVd/QBydFTFhi9HLekIlAJH1rI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt2o9oYWn28tLrPlejkDOm+vJi02xNKibRMGsNQXkkzDmzgc3K
	xgu6oNS3SRWTTnGqDbrTHgVo3G5LHfHDmd7t6oGEL4WupUaPpal+wM1b
X-Gm-Gg: AYBFou2udBZMZifa8PqI9XHD87Gy3YFQ0b/hBuF90Cuhsmg/ij5xklx6U4WRxlYBSJc
	Bufz5WJ2KXsOQVAItafE0r0aNYY42rFtMkpCCDMhFlazNcKw5XU4uwSjITY5Rw4G6u+etQXSw3U
	T6YYjBpYoAaQc4F1hDvtsIj40wmp4a4w8qmywxTb+27t+bBrFksyVohN/5QkNB4OKrxEKiWe1mU
	T9/50X8SUfaLjV3l5CAiPj2kPu/L+PFUINjSHwkYCJW3leduFhsYOMJUZzLx67Jdfj0utMbe9o1
	mVRynbEcVH2trX1eBDYxGsKQGKRqN4hRSv8rXSIiEsBBsUjYXXHyHrizU29rJLjzMt2GrtpaH2o
	FPHf/ww/yHCvR97TUfFVPtefbC+gqXzjYYuTszo+fVdKbKPlY/H75lKWwjnBLfHhVza2VrHzTQ9
	SahbRwwX+koFS6+P26Q6qHjRov0wXHuWdIospYZG4Gtpsxu1TFeMl5Kl5mmPrRipUpBlpnmhZEF
	dw=
X-Received: by 2002:a05:7022:699a:b0:16b:1a1f:ed8a with SMTP id a92af1059eb24-16b1a1fede2mr24381404c88.39.1791935162803;
        Tue, 13 Oct 2026 16:46:02 -0700 (PDT)
Received: from fedora ([2804:29b8:508d:af45:a398:9dc5:b37c:dfa8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm51257744eec.0.2026.10.13.16.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 16:46:02 -0700 (PDT)
From: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
To: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Subject: [PATCH v1 0/3] docs: translations: pt_BR: Add process documentation
Date: Tue, 13 Oct 2026 20:45:41 -0300
Message-ID: <cover.1791933697.git.lucasadramalho@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Brazilian Portuguese translations of three Linux
kernel documentation files:

- Driver development debugging guide
- Researcher guidelines
- Stable kernel rules

The translations cover driver debugging techniques, research
guidelines, and stable kernel patch submission procedures.

The translated documents are also added to their respective
documentation indexes.

Notes:

While running make htmldocs, I noticed some warnings about duplicate
C declarations in the driver development debugging guide.

I'm not sure if these warnings are an issue, since the original document
uses the same kernel-doc directives. I kept them unchanged for now.

If this needs to be fixed, please let me know.

Lucas Adryell Ramalho (3):
  docs: translations: pt_BR: process: add
    driver_development_debugging_guide
  docs: translations: pt_BR: process: Translate
    researcher-guidelines.rst
  docs: translations: pt_BR: Translate stable-kernel-rules.rst

 .../driver_development_debugging_guide.rst    | 244 +++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   6 +-
 .../translations/pt_BR/process/index.rst      |   2 +
 .../pt_BR/process/researcher-guidelines.rst   | 188 +++++++++++++
 .../pt_BR/process/stable-kernel-rules.rst     | 258 ++++++++++++++++++
 5 files changed, 697 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst
 create mode 100644 Documentation/translations/pt_BR/process/researcher-guidelines.rst
 create mode 100644 Documentation/translations/pt_BR/process/stable-kernel-rules.rst

-- 
2.55.0

