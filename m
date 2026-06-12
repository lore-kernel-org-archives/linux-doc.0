Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9464386543
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278905; cv=none; b=eZ8mCsRDSemK0X2g9kniE4AlOmHKCAdR91InTWsIC53btUmHInxqjzLDRo060SJ/ek+3I4a+nCdxfFaImPaELjC6ft4+W8pgzCxxWUzZQmxIahmlliDYPQGEikjgNX0P+XbOE7Tt9xW86MgEqVvjmPxWT1keQBARq//CvQNoPZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278905; c=relaxed/simple;
	bh=XSbiX35MYt88wNRA9jDtXoTuBV9O4gzqI0rmqMUENh4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=bLX8BNaxJzLNIZF0uV51mhy93HXzWuC7G4lCilJgNRMG0PhiVFvgrTdLm2kTDd2veVbTwH220qEs6GPftbv2874O7GyPx0sL6XDx8gnPiKkA5pxjCrMQHa8Z6B3iuBKgJMFJC6+gGVHT06TkZ3Yw9QwaaXCowjtKeVG+i5aHjhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlFMvHRd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlFMvHRd"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf2247e38eso10848205ad.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 08:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781278903; x=1781883703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMSNFcJBymbDQ1FfS4jB1HE+wy0VFeTfT8KyQHMfM+0=;
        b=OlFMvHRd2nHn4pXboAm4JWdrjunnpY3X5tnn3aOs+BhcureGIn51EiHsXYf6RVxw4P
         fqD63Wry05TLH6Z05ZErieP7hJLoUFuA5XQJEpctvFv4ssrZEyF9eRFTJe66bswn8dZH
         3Wxcox6czeJe3aBp/h8IMtC08exIeJ/fQq4GRtt27eaDRtYbdwmSiXr2sEyZZj2eAueB
         JFNiPTbmFRRSEt7AFVR+rgXO6voN7y11nDRPChKH1JUPfyrZPZa/QorgzO4Qofk61zME
         ijD7GuxY74NaAKbV9Oy5yONmB2/kbcqCmNR7bL1zCOKEyaLKvRcyuj4cSe8h3Z7Tc2LI
         NhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278903; x=1781883703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMSNFcJBymbDQ1FfS4jB1HE+wy0VFeTfT8KyQHMfM+0=;
        b=kX/AIeWoAuKXX1di+25k0YL4cG+NwoJSSX4qJXkoCYrqkylOOhR+tKMTsW6aFgGBGu
         6iSDnpNG2lTcGdoEUvjyaZNoq0VB3GbVL7kLodDTBRxrZMarLrIpp+dwJyW3hO0yyJ3N
         rzc3b6YRInCI1Md/tWndTfvgNVLrxgr/X7ZIEbIFM4CCmpqdEDlVAvvVPxv6pV4XIKRS
         7GTI0cEY6zJbp0SP4g7SMuMl8yiIWdARmVhuH7OsK0hb9OXyO1NpiGFW69R44DoSOun/
         Zn9qRwa61Z4XvjTyy5YpNQ0stxFe0PiUv4Cajf7tBqIKh22pJzWBrsIv8L0yfWDsSnmp
         4axQ==
X-Forwarded-Encrypted: i=1; AFNElJ9effA0t2/8+fuC81UdPuGsJFjDaQ9kqGOxIeGeM8vz1+3xkX8CFCzmlsX+YRpVoD2iZWKECxsuNzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSD6NNnzvV7PADXSGFCMQx2+FuVny03wHVZcZPsa5/MtddTeQ
	PfnS7qSZlpZpDs8Jrd3E78x2e7BjcFkK3R/dz90n2VIeD6dFUtHH507P
X-Gm-Gg: Acq92OGys+wL7ZJG11m9eeZK273plrbBqw9OWZ9SR5dyGIv6zc52ji+hGIAELW2hdat
	iTYhvIky6RyT7MdL8B7nUNLZg417lxJBVJoTamWjRwcevptzb5ppRwhkPVT1GlVVVjqdTEsxFNU
	845nDocjYqlJvBcdMtffYvz5F6S8Bk2effQoBFShyz11yXmZY/oHIIzgOpooZxPjltpSK7ry0Bu
	o+CPU4UMCTXI/fV2sTMbk4+tDQDmG6voswnDkaUYHu1Mntyc/dMG1QJCP52s6afDwWijlgKzpjd
	ngmxuw5RCJ5KUZxc/SOeZcwc5TBT6/EkFJm/yPE5yJlSgkGQFREFa6SmCa6cm2pglGgtipUjgvj
	SaALRDMgEyPjCo05myTduHKjkXp1jc4P89ibittx1fcftPiFy5f0r4QMQOkS6GNv7YqlJ56IOuT
	1O3jZ332Yz8yz8ZqelO9DqN264EQvYe+lxdGfmbV8IqeyMwga772Z1VmOvICgEWrmDMVyxtwf1O
	Gwij7A=
X-Received: by 2002:a17:903:2985:b0:2c1:564b:4f47 with SMTP id d9443c01a7336-2c412840ae4mr41665205ad.26.1781278902981;
        Fri, 12 Jun 2026 08:41:42 -0700 (PDT)
Received: from shardul-ThinkPad-P16s-Gen-4-AMD.tail792e28.ts.net ([2401:4900:1c17:d4b4:80cb:f14b:59ec:7cab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52b5sm24559555ad.7.2026.06.12.08.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:41:42 -0700 (PDT)
From: Shardul Deshpande <iamsharduld@gmail.com>
To: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Docs/mm/damon/design: fix a typo in the Address Unit section
Date: Fri, 12 Jun 2026 21:10:54 +0530
Message-ID: <20260612154054.720363-1-iamsharduld@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "Address Unit" section misspelled the C type that the DAMON core
layer uses for monitoring target address ranges.  Correct it to read
"unsigned long".

Signed-off-by: Shardul Deshpande <iamsharduld@gmail.com>
---
 Documentation/mm/damon/design.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index afc7d52bd..899ac9c69 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -140,7 +140,7 @@ as Idle page tracking does.
 Address Unit
 ------------
 
-DAMON core layer uses ``unsinged long`` type for monitoring target address
+DAMON core layer uses ``unsigned long`` type for monitoring target address
 ranges.  In some cases, the address space for a given operations set could be
 too large to be handled with the type.  ARM (32-bit) with large physical
 address extension is an example.  For such cases, a per-operations set
-- 
2.43.0

