Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913A726C3B6
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764339662; cv=none; b=fS94eGFl9l62OsErAJeKBX9YAEVbkkex6cxBGsiLBQX/qtATdcrwPXs23y1TTX/Ql39L3xh19mz29llpo+OQCD4ygZ0EgsuqJHozE1h6NDiH75trDAIDDzMt1AzeFB1K0HgJeAgIqLtrPhZgYIB0Hrb7J/VyhwBjjCVfSU65auA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764339662; c=relaxed/simple;
	bh=l5BDYV3IccAjXWnERTb8MoqCQSYX50xpCWmO7VFIcqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYgTEFvYvfow5iLrR5qUP/mSxi0aPS+2Dism6RmzOdwHVgGboasJCrwbW9GAc+Ctkca1RpTjlNxFWzd0h68qGDMw0LPXfzmzQksAH+4A1uc0XE2AdmLWMaobpW1YeUWxtp4kLGsYEt6REmv5XDPRw1UlQxTEQGn4uF4L0sEddOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c6d13986f8so1260376a34.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 06:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339660; x=1764944460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=45CbFMqcYO42MAEiVkhbYfNu1XqAKx1obOpQGrYaXm0=;
        b=nE6fFibzHljD7uQuXbztIvCeKLnzxKZJcGAeGCFeLrl7lahpkxmmuD4HJPLmzOzA5p
         CiSmv3WQnrnhxbGhLBefipp8yciSiC1jeg9fuuv/NmrOIKaa8EiU20B94pDqLO6sIADm
         Jkf5PTSwovmrsCLtxsnta06+o+etdOpFInXNRSM0i4HNQaqusyp01GeLCFLsIenqS5M2
         UvYBEYoo1HKe/IAgF9I0GVvhP/f9dc5Bm+rx6XnOWJzS5jjhGAsZFGA6a9U70u635RcP
         4RSgQxYCUH3xTae7MtI2HB5lEzh3CWIiKXueh2ayt5UhPOOUIDox5+C5AdOyWREAIT9X
         MqkA==
X-Forwarded-Encrypted: i=1; AJvYcCXsBtpa11CZ42+ebkmfM8h57zuq0JbfEDe8vNyrsN89WgbQy+fxyFscVKxLEzB81z0hikbPV9eXvgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYuJG1w2Sy7mivQ8pajr0XTxkQ4fuvTSh5rmO86tlNF7Q5wPww
	ZXj0dl+pMxNbnm7g3PvVwRr268bCDRDuB50X2GLO+Z9EA0TH0S0H1j3b
X-Gm-Gg: ASbGncuTQkS/MQYHPK4UfAKfPg9tnaXoMB4iXrOIXdeA6QEmfkLWkLNGp0yznIfaUKn
	AbBSOlIM2Pf9ipnMjLn/KSoNal/9fTTF6CymeuNbWXD3owtYYknDwbhAxTEFfRn7zKPPBBEv+0s
	dzL9WHW09/E52yyEDImBdlwCV9ymgvhDoecVp0FH7Wo71wvVp3NiUhf1obwXCcs1oX8Kthab0W6
	myCTZZSj0rsUhaoopcAlbpW6MJKaZ8i8rgg0KRd4syQLAfzDGroK9aqXRgegMh+LH1bcCDd8lqZ
	jchq+NIOOPJIbDMcJN6tkxKCLswakxqltK98hZQAV0MCSprfRdJhhtl6f6K5xw8xupQzjUDRO+J
	8dOlGNt4/ICdMCq/XvtPgrSvD/tMFhtAJZRQFM+L8C++aa0rXzzpkUvQp4/Cyuur2/nlMqfsGxc
	jHipg55JEjaYpLAQ==
X-Google-Smtp-Source: AGHT+IEzB0fmoP2bk7BNz4KK7LqOyyEGrRZVUZxjqjd+26Lvgjym0892sx3oCpX5I9zgbNEQhbrK6w==
X-Received: by 2002:a9d:738c:0:b0:7c6:d01f:591b with SMTP id 46e09a7af769-7c78eb15f9fmr12369680a34.13.1764339659731;
        Fri, 28 Nov 2025 06:20:59 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fe0f49esm1579149a34.22.2025.11.28.06.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 06:20:58 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 28 Nov 2025 06:20:48 -0800
Subject: [PATCH net-next 3/4] selftests/netconsole: Switch to configfs
 send_msg interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-netconsole_send_msg-v1-3-8cca4bbce9bc@debian.org>
References: <20251128-netconsole_send_msg-v1-0-8cca4bbce9bc@debian.org>
In-Reply-To: <20251128-netconsole_send_msg-v1-0-8cca4bbce9bc@debian.org>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, calvin@wbinvd.org, 
 kernel-team@meta.com
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=leitao@debian.org;
 h=from:subject:message-id; bh=l5BDYV3IccAjXWnERTb8MoqCQSYX50xpCWmO7VFIcqA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpKa/FRW/67U+WfAFgUFVwZVdflUFfJRqi0ktFm
 ozlZltyLqeJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaSmvxQAKCRA1o5Of/Hh3
 beRHD/9sucB/RenAtgjyPz0c01Pjjs1qonmSFXA+Qo2wPXUjADkRgiRN8e+n7tecoQlgtkwo34a
 Jh/a58GexNgGEqc52t6je8Gm4qnrZXQDti8K1vuKGn1tZbtSlifvfZtwnKehE4N2cOOYrs5rEBl
 h7XM2EOpZMioSBxfBRBiNmOs7obYwvmmjF4R6ey/iDu9U9uYlJczdXzkfw9cWyWDvTqDMsQgG9q
 GrzPgydotvWYViFSZcmItclgyLyeomX9QRrg9LTGLqlLB7euY5tRwu5NFNZO5CLCA/Q/PiMmM4P
 SFK1LdsT9Mi4mZ5Etf97p4jyJPX9zc/C7lKPuuKTl1W4Zm9Y3dVuONVc4ohfLWcgVpktN0mXsDI
 l7eDH+1cnYGIjAP40cSOOHTlVCNuiV0NP8yLVqV38DggoGtAtY9pyqJ+evGVgrVWV44BsYDXdru
 OtSeTCfMfa9laDUgIlFwLZzf7+LO+QeyN50FD6VY/0khgn+acdh9f+utb3NS37lK+JVxe3qPrKN
 IR2U4V/awXjN/UDQFygcR39H85Fp5rSDJGoMGdnPzuZUnltlBLDmpFi286BkAjEdBIdzCqAfNNi
 Hk8wAA4v1np+MKZn5DxX1JRq4J9pxg9fPHfADw30G+c8Bq26V6S1rt2bajghy78YKavon21RH3h
 XK4wd908Tz1a1PQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

Update the netcons_sysdata test to use the configfs send_msg
attribute for message injection instead of /dev/kmsg. This
validates the new direct message sending functionality that
bypasses the kernel's printk infrastructure.

Only move this test to the new mechanism, given the traditional printk()
flow continues to be default path, and the one that should be mostly
tested.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 tools/testing/selftests/drivers/net/netcons_sysdata.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/netcons_sysdata.sh b/tools/testing/selftests/drivers/net/netcons_sysdata.sh
index baf69031089e..27df730dc8f3 100755
--- a/tools/testing/selftests/drivers/net/netcons_sysdata.sh
+++ b/tools/testing/selftests/drivers/net/netcons_sysdata.sh
@@ -195,7 +195,7 @@ function runtest {
 	# Wait for socat to start and listen to the port.
 	wait_local_port_listen "${NAMESPACE}" "${PORT}" udp
 	# Send the message
-	taskset -c "${CPU}" echo "${MSG}: ${TARGET}" > /dev/kmsg
+	taskset -c "${CPU}" echo "${MSG}: ${TARGET}" > "$NETCONS_PATH"/send_msg
 	# Wait until socat saves the file to disk
 	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}"
 }

-- 
2.47.3

