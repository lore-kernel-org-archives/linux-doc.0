Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F749315D53
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384907; cv=none; b=R398ppebLC7hfJK8ZdXJufi1b8WySDtu7gs0MCaLKI1PTM48Oh9GzREncF53fzuZgkea06dlZwnGr+rj/S4eAs11rta+zp5UeQ7qxqhzNUri87EgGXvkKx2tqzltuIXA67EFSpV8Yv5eOw5/UjbbV/jPhHG+tWvzh78MAtjGQcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384907; c=relaxed/simple;
	bh=ucIyPjHyEfDzcgtcZ5SY4InQloL65MTRwkEsaPC0xNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPeT1apoQkA/CMcRya+dCkB2ioY62AqjW+byvTpLb9dqDI1vPvfNp5IiGgfQlXXQJuJT92J/u7uwJTNGaM6jXo/fjO7NkGwTmfHB7cYU1IeV1dPT/bk1/PNZvWZuYxIpkFIJC17r1XuEAeB4VYhsnXFtOB4RG/DCEfz5ydnuW8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwoSSEFX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwoSSEFX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so876175a91.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384906; x=1790989706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGJLJUYX098b2C/p5zUf0et0pH8c8hAZraf8w7dpmdQ=;
        b=VwoSSEFXd/gwvOhiJlMe0r5bq5ycT6wXyoeu5n3SaALPFfMIporDR7XjXBexsNMikd
         LGp+Ur9+9KRhf6LFkbvtb8aP5ok4nlntEN8kUmTLq2o0VynBDtHKPEOPapZqmoQ13IDl
         tr4nJUeS2mnbpVCzk76jtOf9AU5Zjd/6+RgLo4vWf80OxdBCMuNA4Kbv3a5lvmLhqa9R
         jA6BfgjZ/NWfIjT0cdPPcBeLCuTB7Fm+7VbHMw2p6IK6aBWue8lxMj7E9AvEkotyJrhc
         ddAbpBzSUpTLb3/GsCypHFOqo6jWlqDvl2jCYi8OrrdjWdLRv6NEiW7w9ZQWCCqxRUv4
         aY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384906; x=1790989706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGJLJUYX098b2C/p5zUf0et0pH8c8hAZraf8w7dpmdQ=;
        b=v3ToK6jPta/WcJeDqwJpBujU0/aN0crmkAGxXFvyPa+Mu3QWR9ZGm4BWMK1XrXqcvw
         EdbkJM7Y1ywlM8rNq+UfWkDlPpe0aQ537knAPFXhr2F2RRVTYTN3CVf3wAvFuOm0z0yj
         CeYMI/2/APgmNVwoLJBvO2sVL4p9HIz4LR/dueQY+27b8SlTX4eFFN7ulZq40I4CMMVv
         JuK/KbUGh+au9MFOrwi/vEyV5Pm06rkrr3RBGgVV0MPnn1m1ZhcuRluAOwhKSbFq14sz
         VotSxH1vy0oTmxEXJ2StAxbcKJUGICWmHu/D0rHl5uJd7zsECi+204h5qxqINWeXpEvm
         BdJw==
X-Forwarded-Encrypted: i=1; AKwUvBx+gY2MEHTIsw/8lEizMYwR9cpGBZpLxRd9H0j/vLgfGGQN5mxm/682le6i5ZLUz9N2RuxBXsm1OAk=@vger.kernel.org
X-Gm-Message-State: AFuF++kuinKoGJ4+NaKFVRvoQKi9ee7PRo85sAjzcVpz1zjJ/BoVlDAz
	Iyx0/4gaxeTOVBifTY3u3+gU8wbiIGJZa0aBTwNkhSUEqW7qNbZSh4R4
X-Gm-Gg: AYBFou1Ji4E1EUTylRMNGrhnL+lLaSlHDy70+d59EwNSBvkWM7eYiRGPDMReNppXAYt
	kqFBrvhsbxNMxTJ8z/CHDjeUXaDb9m8GiDnVAmPi/q8xExHEr2qXk6LkUElSh1XOWcObqSr5vQf
	I/xjesuaDPtRMc2kHi7VbPWq47UIeJtDfXyVqRfl6GLczrQcKTYAcee1sQ3yWJfE0fRcbrySnm4
	AP0lGh2Vn+t4UGdBwXAougecLlXTAO9iHi8mRHDwox1Un3uABRgXfuEAPlf0paVcrUzfEFWPqjE
	pnn4k3DixLROqgc1rZBQaKZI1i9WzxLpm+CqUqSRweZBXkmPAYD0m5dKmUBgweqHzChU1REq3/h
	F/yIpgZJlt3Kte0EYj40ELEzMCfFJBFlRNIePZCht1SJfsLOTRBiY/skUXLOUcj+9MYKyOmUOTh
	8dqqyYyI5A2bWcAloO/eJAU5UWAnow44W1kEcSYe/XMBh3AJExoAQtvklzjsjkjYA/YrvWcu3pg
	togYyR0Mj3o3TbckDtydOE8sv8l3qu+CKBas7SKOD1E5OU0Tdx13BsSoDTXAbY7SV1g9Pslu47+
	o1/HYBJPm5cnKAmSYL3KCeAoCJloDAippdYqL961ANpmueeg1J1kFjgzsvOWpg==
X-Received: by 2002:a17:90a:10cf:b0:3a0:b7b4:b649 with SMTP id 98e67ed59e1d1-3a0b7b4ba36mr2433638a91.52.1790384905575;
        Fri, 25 Sep 2026 18:08:25 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm13169486a91.3.2026.09.25.18.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:08:24 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 99D8516C9C96; Sat, 26 Sep 2026 10:08:23 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>
Subject: [PATCH v3 1/3] selftests: kselftest: avoid cd - in runner
Date: Sat, 26 Sep 2026 10:08:17 +0900
Message-ID: <20260926010819.604346-2-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926010819.604346-1-thehajime@gmail.com>
References: <20260926010819.604346-1-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kselftest runner currently uses `cd -` to restore its working
directory after running a test.

This is not supported by the minimal BusyBox hush shell used by some
NOMMU targets. Store the original directory explicitly and restore it
with a quoted path instead.

This also avoids printing the directory change performed by `cd -` and
handles paths containing whitespace correctly.

Cc: Shuah Khan <shuah@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Hangbin Liu <liuhangbin@gmail.com>
Cc: "Ricardo B. Marliere" <rbm@suse.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-mm@kvack.org
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 tools/testing/selftests/kselftest/runner.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811dc55a0..8fc1018d6fec 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -130,6 +130,7 @@ run_one()
 				return $KSFT_FAIL
 			fi
 		fi
+		OLDDIR=$(pwd)
 		cd `dirname $TEST` > /dev/null
 		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
 			tap_prefix >&4) 3>&1) |
@@ -147,7 +148,7 @@ run_one()
 		*)
 			ktap_test_fail "$TEST_HDR_MSG # exit=$rc";;
 		esac
-		cd - >/dev/null
+		cd "$OLDDIR" >/dev/null
 	fi
 
 	return $rc
-- 
2.43.0

