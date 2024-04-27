Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CF739AF9
	for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714206255; cv=none; b=I+Fg164lQFPwiX0UoLQ6A8EU9lzlwQUZMwUrGiu7Oqh/SiWbTpV7q+l+87MXh68aCZM3jR6LVsibm9GQeYLZD0iHL3aAon86msK20doXP6Q1WA1Q4qeck9v3H1T5Z1M5speho5MNW7+i2hcWpwAsv7i0m1dpSpw2h2sorln9CHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714206255; c=relaxed/simple;
	bh=ACYvUCE/8N6QVZZfvRpS1erlyIA1H0Lx8Mh3GBzc2Cc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=gAMt+e9w5rU+6M4pGPdij/6c44eVObsqVuNIYhY69r8OCIUWJ1awDj9dhE4l8QnLXSaaC/gsSMoBvDqDWld9G1NNMcNRSrKtCC4ztwTg8PiqEViR7n6X9MPUMwI71/M0oSRNU4cOpmM2LiyZ9yF9fGRW1wPunwqYfyF9zQ27OXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEtKzh21; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEtKzh21"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ed3cafd766so2740597b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 01:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714206253; x=1714811053; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8edj/aAbmjOrsBEFfJajXhtCvHSsapnNpQHoD9da6Qc=;
        b=IEtKzh21GtN0lyBdUpxUWqpP2fa68LACvAbn1KqVikPpBYgh5TtHPSrLw8faAp78LP
         Mhzw4mU76XPw4Z6J19q+SR/lkvNSZAGUPSbaaBXG8c/TdkdHkGWtnshHQ9MxilCKYS5h
         ubbypeduZss4inqWgFmD3RcoRirSfI+DLjkRFYgH6TVAYonH+Jju+uJj31WS650l9xzm
         8XJsHIX0nT04DwxFbQ9wjxqS21BzKudxt4jyy6/Gp9LtGOGcACcRjkRMG+cAdNx1yhPq
         lybysXMWK4h+0YtzcmXTyyLGT1yixtThmTnb7srS5f88o1i+P0AJ4yEBAHNatWxpYlyV
         Su8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714206253; x=1714811053;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8edj/aAbmjOrsBEFfJajXhtCvHSsapnNpQHoD9da6Qc=;
        b=ugQlIyT4g5gXNZUySnYlKRfCBdy5xxv7FzgsLIRiM5p0ngzdr0hDXBHY+ww7QgLQjO
         S3rtvNKUjn26TAHvl7IQx3mcV8YyZa9vFBrkSPGgfTtRiqXSMzi6xg0fBf9nnZV8c8UD
         6YdruTeV2K7fylaqC2rNzl58HUtOU32eLbu466LDASxrNLbJYs5HdIpPaPnlRYQICfvi
         NBk4FwLZIX8jTM747SW6Xa6+7xKb1wvrWVnV5G0DesP3n9PTjz0+pkfXZuaQy2vPvbM8
         m5nBYGTihbsw1BQ1uuLYMjaAy6UcgqSkWFMOd9Lhi6QaIH9fUOWpNJUQil/pvnJ/tyfq
         j/Yw==
X-Gm-Message-State: AOJu0YzOhp7QcVEmYP6Eg20afVc3wlHumdLI2GGW4GJUr/+kDIph4Fwe
	cFwtzYsChb3yHWCXIymu73261tiNGPJWd1Gfchub7dw1yCUIvFPF7idbzg==
X-Google-Smtp-Source: AGHT+IFY7U8SUiwJiT018zKwzONRZc7WUkWWlv667hF7wRQjIrsQNamvycwDdy4q/CHAj1e5ykAdIw==
X-Received: by 2002:a05:6a20:975b:b0:1ac:de56:eed4 with SMTP id hs27-20020a056a20975b00b001acde56eed4mr5260689pzc.53.1714206253499;
        Sat, 27 Apr 2024 01:24:13 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id fu4-20020a17090ad18400b002acfe00c742sm12188071pjb.21.2024.04.27.01.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Apr 2024 01:24:13 -0700 (PDT)
Message-ID: <c62ba2e6-c124-4e91-8011-cb1da408a3c5@gmail.com>
Date: Sat, 27 Apr 2024 17:24:11 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: scripts/check-variable-fonts.sh: Improve commands for
 detection
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As mentioned in "Assumption:", current grep expression can't catch
font files whose names are changed from upstream "Noto CJK fonts".

To avoid false negatives, use command of the form:

    fc-list : file family variable

, where ":" works as a wildcard pattern.

Variable fonts can be detected by filtering the output with
"variable=True" and "Noto CJK" font-family variants.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 scripts/check-variable-fonts.sh | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/check-variable-fonts.sh b/scripts/check-variable-fonts.sh
index 12765e54e4f3..ce63f0acea5f 100755
--- a/scripts/check-variable-fonts.sh
+++ b/scripts/check-variable-fonts.sh
@@ -20,10 +20,6 @@
 # suggestions if variable-font files of "Noto CJK" fonts are in the list of
 # fonts accessible from XeTeX.
 #
-# Assumption:
-# File names are not modified from those of upstream Noto CJK fonts:
-#     https://github.com/notofonts/noto-cjk/
-#
 # References:
 # [1]: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
 # [2]: https://lore.kernel.org/r/1708585803.600323099@f111.i.mail.ru/
@@ -96,13 +92,15 @@
 
 export XDG_CONFIG_HOME=${FONTS_CONF_DENY_VF}
 
-vffonts=`fc-list -b | grep -iE 'file: .*noto.*cjk.*-vf' | \
-	 sed -e 's/\tfile:/  file:/' -e 's/(s)$//' | sort | uniq`
+notocjkvffonts=`fc-list : file family variable | \
+		grep 'variable=True' | \
+		grep -E -e 'Noto (Sans|Sans Mono|Serif) CJK' | \
+		sed -e 's/^/    /' -e 's/: Noto S.*$//' | sort | uniq`
 
-if [ "x$vffonts" != "x" ] ; then
+if [ "x$notocjkvffonts" != "x" ] ; then
 	echo '============================================================================='
 	echo 'XeTeX is confused by "variable font" files listed below:'
-	echo "$vffonts"
+	echo "$notocjkvffonts"
 	echo
 	echo 'For CJK pages in PDF, they need to be hidden from XeTeX by denylisting.'
 	echo 'Or, CJK pages can be skipped by uninstalling texlive-xecjk.'

base-commit: fcb5bcefdbfbd939bf4edfa71182df0b56d20a49
-- 
2.34.1

