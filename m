Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364433;
	b=gvjOPEwhnHZ9n0owWbL44guhVvpeUTdyFynJlCpUshpxoMsbVCWd/LmXRusZPrIDiFpX
	 zB1ivc47IQf4fNuvg1yaeGqxYKRmaaDci03WN+uYnGC6uMzHaeMKWvgF7OwU+VMqNveFo
	 yJd08062HgHZgUs9qc0+hamSMW47QtpmM4QW5Spty1YeBGJRvxMhEg4GufG7HXGrbaBFn
	 tVnNnOiO3MZL5u1pQDOx+fYmP5AYh6mcsFLPMRopOpqLUkza8Z4XIY2r8nZEw8A2Mq/3T
	 5uOztQveFp0loHN14IkokhKueB5LKcooYxN/YRqF7uCx33t6k3d5bbchdFXO41PGxiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=U0zckNcofs5NcNAnuCtdYJs+4hx2lPz3JUe/9YdZO5g=;
	b=0iOhp9EoQ15nzst/+LNOEGB4iYZGJZjvFE1lhUWJzB2adnHxGerOhqIjJ/I0IgvlA1r6
	 0JvgUMdS/gcdcHMRK0TwFF2DmxXgDWGeG+zvffjK6tcpHYtUdC8otQubI72s+LLI/Luii
	 fvUwNSwYWDb75pb+lmDpMfuEnWUOyP4fTwVedy+nWHCjMj4Abd5NcfUx/GkV+r9rYnLE8
	 TqhpeBULxwkV2XvIOZuyXDU8jFS4pbNBomvpRHCo4XVRX6Xh6myLYcf2h7nGQCtXFX8WB
	 IH18LAfSgIPM2coMQZVnnhilN6KUpUoPSxT3FIxePg8uJ2fX9tc7IGb4HawPvNrizlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDoRjiRp;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A80606A321
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A80606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDoRjiRp
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so3565143c88.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364432; x=1794969232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U0zckNcofs5NcNAnuCtdYJs+4hx2lPz3JUe/9YdZO5g=;
        b=lDoRjiRp+r9lvoONBg6YIG/jlpeG1JNWGCMwCn1fy08Zdq+sUh7UxgxTQUSSqFMuaD
         PTm4YKlJGGVxBctMY2hOW8FSlnfOwJ2KIl1UwxCyCZRVc9LO+shNnXJutIZdiBHsvcdz
         sE1Z/M7D+m0Ee6AIP9sYRmOzXl/s2JT4Lmdp9a0qhEgrB81ZjNEcMNGacJPIwA+zYCzm
         Mg9zywscphQsGPoXy2/f5LJlSUOJpGrNEfr1ClOvBOncZc14K/3ZvKJcH5B1A56Bjci6
         oqDOJAl687NXWyF5mLH1LJfuRcpBcnVEpCmm78UagWpOwg57xdxUECk/mFy49ijASUBW
         0MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364432; x=1794969232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0zckNcofs5NcNAnuCtdYJs+4hx2lPz3JUe/9YdZO5g=;
        b=Y/Uto4ndht2agBIQB1LkIksE8jhLvPkLw7N2YGyAts8+jszNTFsgLPmjhu3Y2oi7wv
         WMQIEWF52fxQ6g9tVR3GjJGml8cVWiVeS2RVbv0TCAbff04elO8iIxceGwDl2JWM6WS8
         vzVrUzF0l+Tj5EDiVTkhDa2lJonFvoQ2EfciqmGrXCze+iicnkbVzimEuDOqIlI5gCo2
         ThWsizKnAim+QFE+eGhvZ90Nki+2kh91kbhONHeg+YRx189otPXBSTtA4BYevDQDeMwj
         W49VK26eo2Zn5+ZcKAchwNhhFeQ3Olt2I+uHdg/vqtU4JbuDoOniXJpbisMh/WhazKOn
         pziw==
X-Forwarded-Encrypted: i=1; AL+hErEcXv/+e71perSkTb9Y2ss0YBAXh/qcd3TEGB4ps4yW9WrZr/n1bht9oifmYBFke0uqrMhaHVel+TY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lKPJVCKPakhe7mpVy9uvwvwCDtLpSNYnAswLUhPevR7Drc3FT
	nmnhdMtGvd0G1LeTSEQr93dsjimF9j54m7xRPxpaM/AxDMW1n/1vov8Zqfmigg==
X-Gm-Gg: AYBFou1nwMBCn8t+QF23lByR8e11zG58yzVkj115tLfgjWpttTKwsa2FeT4b9HX+Swq
	FM0S2aBjpt8gd6hvFk3VjjW0knZCGORCW0wUvzzNuT1L2bR6nTeIArFcPhG+Spet9TpDkq0z8YD
	H4DOIpSG2MOFayUdSgdLXRZdXs+EBKdJYdDf1HaA1N/78dgxGa24M0VlNUIDYEdVasROreU4g2Q
	AqRZgA5Rds+lGxbZi0uqUPJzEWHIXQQwUK5vz1gwPjsQv2Gi8hI1ulg/xvasuU2xnDp9O4TLndB
	f9CFtMlIbv4sed3+ALf2RzncMWm7EMlSvOFHTZrQcgwOBr/sIUDqpZ308apvt5M0L8T/Nuf3VAy
	JjPKTytfXzjgEqBO5HwLEkFqV3oSDYr0DscA9mwVFO1yOBvLPZvM3e392V25a9VM5zpasYxSpW8
	9EmhfWCdEfiNtLXKLo0BszZgW85MPaGHOz31e3LKOsPjQ+sTR5fBNPBOeU1zN3pWoOkiGFxBDC9
	g0s0PxyJJAwXCI98U4QfQ+3KVOJ7bF/t5FzXx8cX8dYJtRQi49NCswoVyYolDmayRRtIClNmQAs
	GWytBQVhr2q/ADLhFJZSDpwYtQ==
X-Received: by 2002:a05:7022:ea8a:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b3c0334a40mr1074066c88.7.1794364431866;
        Tue, 10 Nov 2026 18:33:51 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9977000c88.8.2026.11.10.18.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:33:51 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH] arm64: perf: Fix the userspace counter example link
Date: Wed, 11 Nov 2026 02:33:49 +0000
Message-ID: <179436442976.1969388.1279174885793827001@gmail.com>
In-Reply-To: <1baeb4ec-4244-42e0-8c53-29df079c80f6@linaro.org>
References: <20261106234551.1474417-1-takano32@gmail.com> <1baeb4ec-4244-42e0-8c53-29df079c80f6@linaro.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

You are right on all three points, and the middle one was worse than a
style choice: I measured it after your message and "perf test -v user"
does not run the cases in mmap-basic.c at all.  It matches the tests
whose name contains "user" and runs those; the mmap interface cases that
file provides are 175.x, so the v1 changelog was wrong about what the
command runs as well.

So v2 does what you suggested instead of pointing somewhere else:
the sentence that sends the reader to another file, and its link target,
are both gone.  The How-to section above already names test-evsel.c as
the example, so the instruction for running an example moves there, next
to the reference it belongs to:

  make -C tools/lib/perf make-tests
  tools/lib/perf/tests-static

I built that pair from a clean tree before writing it down, and the
Makefile target produces both tests-static and tests-shared.

The section on heterogeneous systems keeps its text about the PMU type
number; it just no longer ends with an example pointer that was to a file
which does not exist.

