Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F92F8EB4
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412476; cv=none; b=i5xJ0tzMUXKjAGncDM3kqZJRviZb2sATNxvZ3UVthUcKUbKDhaEdQ/CaiugqvHAgsuMVuaUmY1MYxtGMIKqbVX7rFYdsRsX03g5POuYkrDtP1ovOTPfhrWwzN+Mx+15lXSwXCf67Egyk3n/+c34jY5dG9FWdY1tv3dgsaEvVD1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412476; c=relaxed/simple;
	bh=yxyDXZcLno5sE381KVa7TTA1EbuqjfV/GZXgaDAdujk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jTdoLKd7UkbnMlkUUTpCA80zNOK/8a/YngkWK8eJn8moVtilEI/ehPg6G3AJ8EcBjy9j9i9fB+TlrBwVU0nJtjkG1QBg+M2iu0VSvrldGY9TwTxxS7T1gqcof44Ri+4a06vmtGFDFwdPuPyF5Nu45vlCn7YPk7z/dswgFDVbyLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cADJuVPj; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cADJuVPj"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso3089662a91.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 01:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783412473; x=1784017273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Fb4S8tu1I2dFGb/une/tIzUUASJq3fORw7QtUUZ71s=;
        b=cADJuVPjO2oPWReRAY2Gsh0Mq4ZbUtkLlmIryMFCbIP/ZUk0BWbjpSBMidaqKFFc/2
         SmqxiBiYYeGmZX9TAQG1VoRpHzE/u+xwxwtg9W76PxYyVIC8DTP2JNNlc5hRj1p3AtGa
         UU63AJr9PR9o/WhjeFh6IMNUdvoAomVYjtSggstBvU0hAOmkdY+0jC9ej1OGl1tSASDo
         4xv4SLV9PYXyQtkEfuiJPIEZ+ReaZPcwmkMSGI3edIqsL8PHt8sKrFGiZmrL4ZpOntAh
         oI+Yyc0fNkd/KFHMwlDpMbMdt6QZrgOzL8ZcpnKjTSW5kwj6DScU1MtPa3xsZkJ+a9dF
         atjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412473; x=1784017273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Fb4S8tu1I2dFGb/une/tIzUUASJq3fORw7QtUUZ71s=;
        b=gPMuPFFCQ6kz2gOb4KCgBwUIqWztrOvVOSg6OJ/+e09ncpdbLIDI1WMu7fzEIDQWnY
         kY8KcZMQGSR8/Lr9ONOsTUPV3yWbiq4bGM8CofB/JzLXDoJZw30InSOAD14rENobCai+
         v160XaS+5HFYxjsxk0TCpUW1An+n217PN6dD2yW8jmyk9bvV4uBOn6Q61VvVaJzN+/b9
         gDK/dlE7dnkc0YyxpWd+SXaDam+FLb+Fxkr2tpHBlvfKLUwIGM14V3fqnRtk5qK2wFei
         knTY726Bz+nP+MCyknGhDM/ZnT6Sdzh5lUI8crhRUU7AQtuMjzGzhlPnn1Nu/LztgEtR
         KQ8A==
X-Forwarded-Encrypted: i=1; AHgh+RpsQsRd0EcncnN3AdSR1RIbQD/1cB6r0A9qBMoWjrPkajG15vsrU8sA8oKh9hoKY+sff1PsxmiT9+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/xeizIk7eR36xPjZocUCNrJsY95ip3d2rLX5elgSqqJY81geh
	0tanb14nr3G9LAjWyUx4tDTonZgDdAxTCVuxqh78g5mr31qUfVLNlW4=
X-Gm-Gg: AfdE7ck8fl7Q5CfXPtMSl0dUoybfMVj4S24ljkvH2eNZgy1zzF89A+Oiz8n3JNPfZZE
	SpOUB/9EbaYOdei4TRaLaEYtjA17eHWH0uSarHkcz4w6ZvcakQex1v6v+JYn6Yb5pmmKpovEhxO
	paMIJGKPm4hppIHbgzrBIUznkU6iCHAthOaX40YievviuRQ6IIU5BzzDg+93HErDEqP6yUc3Gyz
	mqBF9JbPt/TiRpa75JYALbZoeNFwMr2DBSOCd35tXx6V/LMd8xQTEIE5p5ih1UnqIp3HHXnWpsR
	u8FU2+fpw/jhaua65CoBkkK5yOk9Y+z8OLv9WplxU5cEqcAH+unRFhSMnc6qsB3wd6QFw147Pwn
	XDSRkGGfaX9ARzkantusI3xqTroO4jj6uAwSK6NwWLYT9CEl1hNtCu24hHWhbulWwRJgnVwt2Hg
	G3GgPFso8Ht95n6134BSIX9htA7lj4S+3wGFTaoEXnrJqTQ+VIgnq/wb0oig==
X-Received: by 2002:a17:90b:53c3:b0:387:e0db:3d87 with SMTP id 98e67ed59e1d1-387e0db4364mr1903194a91.34.1783412472075;
        Tue, 07 Jul 2026 01:21:12 -0700 (PDT)
Received: from HARICS-M-4G70.cisco.com ([2001:420:5448:1302:7815:d910:e12a:f166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8f521sm5696125eec.22.2026.07.07.01.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Jul 2026 01:21:11 -0700 (PDT)
From: Harish-CS <harish.cs.ss24@gmail.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Harish-CS <harish.cs.ss24@gmail.com>
Subject: [PATCH] checkpatch: warn on Rust unwrap and expect calls
Date: Tue,  7 Jul 2026 13:51:04 +0530
Message-ID: <20260707082104.90951-1-harish.cs.ss24@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust panic paths are discouraged in kernel code because panics currently
lead to BUG-like behavior. Add a checkpatch warning for newly added Rust
uses of unwrap(), unwrap_err(), expect() and expect_err() so contributors
notice them during patch review.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1191
Signed-off-by: Harish-CS <harish.cs.ss24@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 4 ++++
 scripts/checkpatch.pl                  | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 6139a08c34cd..afa9787c1b9f 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -303,6 +303,10 @@ API usage
 
     See: https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on
 
+  **RUST_PANIC_METHODS**
+    Rust methods that panic, such as unwrap() and expect(), should be
+    avoided.  Handle the error explicitly instead.
+
   **CONSIDER_KSTRTO**
     The simple_strtol(), simple_strtoll(), simple_strtoul(), and
     simple_strtoull() functions explicitly ignore overflows, which
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..5bdb065370ea 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3972,6 +3972,15 @@ sub process {
 			}
 		}
 
+# avoid Rust panicking methods
+		if ($realfile =~ /\.rs$/ &&
+		    $line =~ /^\+.*\.(?:unwrap(?:_err)?|expect(?:_err)?)\s*\(/) {
+			my $msg_level = \&WARN;
+			$msg_level = \&CHK if ($file);
+			&{$msg_level}("RUST_PANIC_METHODS",
+				      "Avoid Rust panicking methods such as unwrap() and expect(); handle the error instead\n" . $herecurr);
+		}
+
 # check for .L prefix local symbols in .S files
 		if ($realfile =~ /\.S$/ &&
 		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
-- 
2.50.1 (Apple Git-155)

