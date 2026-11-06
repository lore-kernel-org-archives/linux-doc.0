Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964747;
	b=eVciABnQ12saxr+5XA8XSasSdRR2d5w+ww3euL0nb0Gtd5Ga/rA4KUKXgXYZdRkVnV3C
	 WLT9k0rjdDB0sutvf1BYWSXqS36vQ3VNrWmVmxyoLtHmAiQrZ5O7sA+fIBw0mamIdb6R/
	 arZYHwrTtioy6jfBaZGpfX7Zy8RJsjcyVQBUVPQmpmvxzZZjAiVxM+OZxJWnPsHBVb+k4
	 6/WMc9y5ddSqxGioAVPq5jLegXvCTyZ4n6r2wZ2P81JwND6GWB369UEZdbGkVXwptxwCg
	 zj5omBa17oVNhroztdFJarPmF/+H0NfK/PT3e23RsoJPCdP9yoZCryHDVk2lcwiyuRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
	b=KWnNTBbI1u6PJLzBoTlRpAiX9VryiBya7+y9TAOAbR9TN0C64K4+mfY9cRc6g3wW+Gsu
	 UwSvtRrZUumFxWb4ArKfjpbuj6rKOvMG/DU2b9+lvRQGa/tyg0D+tnv2lfcW+6+FaKGhI
	 vVswfInzV+4Cv1d6aJcIIKzvltPnLYyCM+kxUlJ4p2v3DI6n8XP+d+Ajd4uQYzI0jwdcV
	 gQJHZXLw1SOxwV9DBhHuIu+O5RjKkFZroZLgmfyiNvr/lPkf551yRLNz4DSu5MLWwRSI8
	 vUMNcGDZrKfqx5gJiqLhSvfCKz5L6r6SAVuaTWVrIaZkKJik8eloTQdfmyGBZ7lxP5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYw8675j;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BBD60A5BDD
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2BBD60A5BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYw8675j
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adb9cbb0c3so55453a91.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964746; x=1794569546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
        b=cYw8675jjiaAp4gtHA7RdAPN+6rUJwlHh9vyrWNCLUCX9FgU02XlaitwwjyzmUklnj
         M+/ew/HzmzCfuxKdfeRnaQKG2THFM9r4ZWikjc/V7O0r24LfYIdf6uqQmWLuFN72Idir
         QM4XM/89aijuzwyF4R9/h+JmGh0ipVzIJbIfSIZ3OzkyN03cn12cFzPQ9ZO2CCyZt9TK
         gPpJWao7wlor6Oo8YT+L0RiC/pPZ13wIAyJ7N+jf4qgHyTtUMbVasdqQe93YBtWsbnXn
         coexb4gwO7GDEoUaQ2f3IVG/fyO17saHHec0itKfDz6cfxwvZggASpnFFvLifMyvgb1a
         A6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964746; x=1794569546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
        b=OKZWt7cM53QZnvxAXBlJbQR3P9k12FBjpTw7dqI8JXwWcprLUJt2FXAZ1fjmKO7J+a
         /nWzfh9yJn7CTJczkxMCLQMl+I420f2E0MXYVruJ0VdeSGE6UHmsu1JRH/GiDhykiv3W
         hR8xYAATnbmNsscPYIRap9IMZ4MCGXn12zzDpvlmVSso5BTq5RziaD9LpeLIEphpQ8Qu
         1ej+cTtLSuPl0I5ZJDksFe+21pQ/QOAGXP0Edph/eZnSX2zaTG+yiIdU3YH3kyguzUAa
         iwDq+tew2TgnsphgKf5IZG5Ehf5wZBIi51HJoJCyajrHhR+vJOPH8+BaFEQzPnYV4gjI
         gvXw==
X-Forwarded-Encrypted: i=1; AL+hErEz1edJFrdTGipQidsey0a83iPibiX2YUUy9TLqQHaA4dCa1gCBWkv8KLcNRGJYGMF2PVg1HeeOSII=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IcSrLwJOu9HOSU2NODeg5uncKQfu3fozjnBYPddPrFNXPezgc
	j+n9bnPf+ys0GlRn4EmLZ0j9cg/5jABw6YSnQ8u9edVfFtNrfLTTHzTh
X-Gm-Gg: AYBFou3S3zZj/YVTHkQk9JcStdbYoPvI8u75vKPZR9j5g9iG+3nTx4mKh0/bhU9tnz5
	WzZ77Qta55tRO0agnziBJWf4/XDIK+ozE5HnIKyGKwuWuFZNTLVjEdCfUgk9H4lgu1qMWfio6og
	jGe66e3YZ5+1q79TM3JoAmlZwiRVLSvEJ7rebPnYt7PE+RQ2S8kGvbAh9lYuU6V9SeoWx14/xyr
	o1RtChA/PjVT3GRjjmCJjZgzWkHUZ84wG4Oma1+bDgk6hC1kdQMZ8w/jK5Vl0d5yEQlBHPyvGVv
	b+IyW1mB6v02Y1/jJsAizpxmhYOJMc0pLsXC/rs+ISo7bbRBm9otaOzgoExwFISLYPWfK8eDxbl
	+TH6fR5JIy+CUv3Tbt5/IH3oPcZjwa0AIz3gI9YoCNDJfLhnwUe6gBkbQ69fRW2DTCnkXNhLvaU
	/aY4N9aBLSkgCtJ8skDmB24XaNWTxZdVm2bmBFBW2cQzLlgGd44Aq+o5G0hOSNtGIB4Y17vBOZV
	K6iJy3dWbzCX5ZHethMQHdTg6LmPwYDiTQYYbhfswgp3TWovVfmnwnUxy9d8hen2UwW8aVt0vM5
	QsOLOdwoWiRbgNy/pMt6iHXN9WyGDMZwS6EtVsHwfUYKnIqNgg4WeNWvmXCLBZhk+A9xk675hPT
	65qITx4JNcUtZip4e88z0MGVt+XZLpWXI+QUoAJAdZG4Luw==
X-Received: by 2002:a17:90b:518c:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b0db6e1fafmr3508549a91.3.1793964746325;
        Fri, 06 Nov 2026 03:32:26 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:25 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 11/25] docs/zh_TW: process: sync development-process.rst with the English original
Date: Fri,  6 Nov 2026 19:31:26 +0800
Message-ID: <20261106113142.706783-12-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113142.706783-1-chenyou910331@gmail.com>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carried no "update to commit" marker.
commit 2b7703e15a55 ("docs: use toctree :caption: and move
introduction") moved the introductory paragraph above the table of
contents, but the zh_TW file now has that paragraph twice: once above
the toctree, as in the English text, and a second, older copy left below
it in simplified-style characters (軟件, 裏, 瞭解).  A comparison
against the current English text brings it in line with the full current
original:

- drop the stale copy of the introduction below the toctree
- retranslate the introduction and the title with zh_TW terminology
  (內核→核心, 文檔→文件, 社區→社群, 編程→程式設計), and rephrase "in a
  way which is accessible to" instead of the literal "可以訪問"
- wrap the :Original: line and the introduction to keep them within
  80 columns, as in 8.Conclusion.rst

update to commit 2b7703e15a55 ("docs: use toctree :caption: and move
introduction")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/development-process.rst            | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
index 1d22aa0d3711..906e635cf830 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -2,14 +2,18 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
+:Original: :ref:`Documentation/process/development-process.rst
+           <development_process_main>`
 
 .. _tw_development_process_main:
 
-內核開發過程指南
+核心開發過程指南
 ================
 
-本文檔的目的是幫助開發人員（及其經理）以最小的挫折感與開發社區合作。它試圖記錄這個社區如何以一種不熟悉Linux內核開發（或者實際上是自由軟體開發）的人可以訪問的方式工作。雖然這裡有一些技術資料，但這是一個面向過程的討論，不需要深入了解內核編程就可以理解。
+本文件的目的是幫助開發人員（及其經理）以最少的挫折與開發社群合作。它試圖以
+一種讓不熟悉 Linux 核心開發（或者說，一般的自由軟體開發）的人也能理解的方式，
+記錄這個社群的運作方式。雖然這裡有一些技術內容，但這基本上是一份以流程為主的
+討論，不需要對核心程式設計有深入了解也能讀懂。
 
 .. toctree::
    :caption: 內容
@@ -24,5 +28,3 @@
    6.Followthrough
    7.AdvancedTopics
    8.Conclusion
-
-本文檔的目的是幫助開發人員（及其經理）以最小的挫折感與開發社區合作。它試圖記錄這個社區如何以一種不熟悉Linux內核開發（或者實際上是自由軟件開發）的人可以訪問的方式工作。雖然這裏有一些技術資料，但這是一個面向過程的討論，不需要深入瞭解內核編程就可以理解。
-- 
2.43.0

