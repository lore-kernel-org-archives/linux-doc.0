Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013478;
	b=NgpNKqrNPNtUwfarM/tbW5ChNP59oRGW1ey1vjieJgGOrXV623pYM624CP8KHQqrv9IC
	 0aDJyzPyKgyAjMAWWf3HFh7qVaxVbIq5ZidwqgfPiCjywPL+tS8CHEnWN+cMqjiXSAmaT
	 XYMnLGFpki2M6uvDOX7iwfR6ltGYSkZAMxHQF35iv61u5CY27lCmGrwtqKgeJkGHmzCMx
	 5VBa1DT3EO3WiJCQQMFZZvlRUU0eLdC/jLlR0Z6lER/Q35m+6C6+sFlzIWK+y0bKThEp8
	 1HAKrGTGl2mQixkhDF1KWvFeTyYeBn29DU5MAAp1NPfmBiRKjqOm2t1EyRjC+/7zulw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=NRIkuKUZUAgjI71v50t8xrAuxWFu9ma5GeG76B0scz8=;
	b=bAOtvJK4foRyQG2nMivUIbDf+IXGqVoBOofXZe7EapSnAYGaqWxutLcvBVttgAJHXLHI
	 5QgW8cK2ZcOPOduEy5GutM7MLCbaoW6hpALflcz9azNuVLnVE7JCV4vstWViqLAeoIkQi
	 VMfJKH/Hvolhon1B0K73VTppG4KNxkDEKCuWfjFDcnVOigmA2Rt1VXoxzmpusBXTN+xms
	 ZEQhXcvgTcGW/x1+ZZAVIvtbGozF/S0Fcy1gw1obkIs4eKzioB3zm7Gy/X1yHSjCgWfJc
	 dWX1+yw8bkF3LXMspc+BMbuZrqRAswEJKcCOVMZKeOC0DpcbUQ4hRq3Jxv2lkuvNSkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LXB3Xngy;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9495606A338
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9495606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LXB3Xngy
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c1c8so11575325ad.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013477; x=1793618277; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NRIkuKUZUAgjI71v50t8xrAuxWFu9ma5GeG76B0scz8=;
        b=LXB3XngyrN0kmxx3Y1iT64RUtaddWXLeKcQrMXaBFct1KQ4MMCaalvTiU+Zz4ai4nv
         kthrr1nNHO95LblZPV3whXJt2IDdi9L6DAuQfP79FNpzEVw30o6xgLB+J5YcfPYdnVHO
         eFX+eIQ8qgxOmmX4E9vJIEODDTOuuHUi4dVR4p3eoTiNrATc77phrzzMplpWrU3kOY/h
         Cp5C/c5lb1/FIGbucSYyg+hZalcfeC1v90Ldn1Bf9Ts3D/Y+aJUDjIZfZXABesKPxRxI
         7u5luoM8G8OPUFZZblF4Rwf9fcHs+lsvXA2vt0m9pHO5MOKJFcsBGJizWMcbQbmfZRhq
         8bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013477; x=1793618277;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRIkuKUZUAgjI71v50t8xrAuxWFu9ma5GeG76B0scz8=;
        b=NIOoMylH/vtHzduaGp/HyxMkZF39ctucxmQ6xZsA91up4DDkCMbeKdEWun1hxk1vWF
         BcVFeTiXE0tq82kbYF8nRc7MhDriEelHKvT+bVZxMuUQqkVvhxmXkgF2pjB+54o9/zYL
         ti0pRaw96cRK4Nb9cukTTc4t2dxT9xo8MU3Hf1vfk2/dDEl06zqqn1s2/B5n50dn553G
         FackAv24+6cFCylWnJ7hys9wZFOZ5eotpfoTK8NNMN60UPm3gUjfRxeP9a/ppA9QNRNK
         u815WZOqCJQbdt6UHbJcBMEljQxfdhr8lO6wcf5mgHoee7TiF5HVyhNFhC/bNr5G8zIc
         D/NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRZ3D29cMyx+oHgekHqBa+s1EY5pzeKHeMKz2NEPVd4D1sOmKtKV95+jesJryLOz9hab+AHgWw7fo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcHuztulBUNjzZTNI3sWpqjj4/fmtVw5R+04qq7nGDV22ckifR
	qUgVcLWXbdLk/Hb1R+sHK7g03fJROMoenyzI26VaefQLSxTNulvcWQAB
X-Gm-Gg: AYBFou3NHKoG1A76DSDlOdQcgUjCq/RW0mZeNkUeRspvDMd86LEHfGN0ch4LgvwX0cw
	YoQSxeIJ+MxQOAY8O+IUIhJOBgewRn2VeKH0jlfxZnEBEIZxkUQvy0n/hZEcra7NIV03z/LDG6O
	3vk5mluCw73qKia7T3k32/Dp0k6kM9uGyN+WRIQyLPOvhIwuytRPwhtqm6h+BVXwGY2imYSH5ye
	2u/NtBeDIP4vJQnIHgf2bV3dGpLgeb62FWDJScVBC6RlVLsTaKI1lJEvSIjHnNQLm0GOJu5nr3v
	Xtx3TirLmhNb/CdrfaMp4frJknWVSq8hVB0Tyfuwdw35KQjkMSKhCY6toDZ/dRerwyUfBSpPOC+
	nFnamcUYMG4IQz9+0WSHwsxFSrhxIad4OF3GygRGdf3t91b7XVkj4UINquKnL96udEA2RW1yhS8
	mVs5W3h3EDFJHlNL58KsP6uXEmQhjzwfTJlx/6llC/vqHBzBXx9yHqhnvWHKoftj04sefV3jwxX
	dr9//wHRTyWNseVgR4h/TL/Xj3xqRfijgKuKUZzlOT1YZQdVCA6eLUw0HtO4VdGb92ILqZWPZui
	iFAjLCqNoHqFrsSwJHC6cT2D15e4KjzjGo/+qKy+UuwwgilK48oTCcILQxTfqKEKusS9CdhsUyI
	=
X-Received: by 2002:a05:6a00:4005:b0:8a0:2914:5d27 with SMTP id d2e1a72fcca58-8a369168952mr5053901b3a.44.1793013477084;
        Mon, 26 Oct 2026 04:17:57 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36acadefesm1240756b3a.19.2026.10.26.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:17:56 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] Docs/admin-guide/mm/damon/stat: fix pronoun agreement
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
Date: Mon, 26 Oct 2026 22:14:34 +1100
Message-ID: <179301327249.2.17530814278215474568.damon-docs-grammar-2@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

"converts it" refers to the access events, so I think it should be
"them".  Rewrap the paragraph while at it.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/admin-guide/mm/damon/stat.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/stat.rst b/Documentation/admin-guide/mm/damon/stat.rst
index 4a9db755a526..a93609649a5f 100644
--- a/Documentation/admin-guide/mm/damon/stat.rst
+++ b/Documentation/admin-guide/mm/damon/stat.rst
@@ -68,10 +68,10 @@ estimated_memory_bandwidth
 Estimated memory bandwidth consumption (bytes per second) of the system.
 
 DAMON_STAT reads observed access events on the current DAMON results snapshot
-and converts it to memory bandwidth consumption estimation in bytes per second.
-The resulting metric is exposed to user via this read-only parameter.  Because
-DAMON uses sampling, this is only an estimation of the access intensity rather
-than accurate memory bandwidth.
+and converts them to memory bandwidth consumption estimation in bytes per
+second.  The resulting metric is exposed to user via this read-only parameter.
+Because DAMON uses sampling, this is only an estimation of the access intensity
+rather than accurate memory bandwidth.
 
 memory_idle_ms_percentiles
 --------------------------
