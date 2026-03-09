Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C02236F0
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 02:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773023313; cv=none; b=kz27A0SeS2kV2QeVhkz2IiyZbrH0AM6lgkCDMMAQO+4GKweTwITfXsAl4EP08dE2QMD4RaJE4GTiYA/aKqepF74qnH5gg/3UDObbNFBzn8rPuoG+fOwJBhEWmnT0aAOC1cfmYL8yBMvtbuoh9oElz34+VxG0CFjR8BSVcoKc37o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773023313; c=relaxed/simple;
	bh=0PnHXD/eeR2S7L31MiPzD6lKHnVR5jRoYM2/It/mKp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rs938QRELoJtoUkpD5xo8N8aFxYcFmIpo5YvR1PYUALC5XYF40CZFtHyhFOSp8CVGYbI9fut+9ITBCbuiyLbVXlwQdNOkh0dwtdrjRHfftabeDvgX/xahN5rVQJGruiLO7kE4SCWediaaks9mpVehb3S1vkOslp1jjGYAXnc+Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+nJB2cC; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+nJB2cC"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1279eced0b9so10086931c88.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 19:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773023312; x=1773628112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps1Hfv9yWFYK/K2noVGj+dmwqc5tyuYyDUSGFJyxTPQ=;
        b=f+nJB2cCym1+ND8xUO2mrmtxcHy4ZhGBuzpCLNKQH7mXJn/X3B0RNAMWbWfOFbbH/7
         hTaK/ej2XrpfF7MBICDhvW4m8dgsN+E1mOkSSkxeu/RrL/amLzE9psRnCnV3DLyU7sC4
         DKk4U6KjxetnqKFAje08SFicMeURkK3eeKBLNx+DY8oU5sO+0GKmXnztPBa+HkcTA/Wb
         tAnyf3TxKZD3xOeiPjrzY05DO9hNMhbPcjU5YPWO+GgiSBcLZpQsHWhPj1UoICpi1K7W
         0Qcu1s2b52qLTApF03b2g/XEYWknIGjw72xytGBYHSx6ZDa8NesgVXcRauwRAJYmrBLB
         I9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773023312; x=1773628112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ps1Hfv9yWFYK/K2noVGj+dmwqc5tyuYyDUSGFJyxTPQ=;
        b=iwbtIhoeuzV/ZNSSoG2RdTwJ7Y4MeiV/ilCQFBJbr87WRkCYrjKzhvGlEAZTww4yWt
         Ydtum8em9IhNT6YdqLWhF1ff1LkBCmgJMm49mutw7Ks0rZETm5ESCx84+XU//kQ1E0cW
         XHiGkHxadn5AJOqKLNYSROb8upKoW47RJbkWJuby175Y064RFEF5pF3Q/4IZH0UoHydR
         37ksAfAqbVQH73fXw+xKK+CtFuJWOG00P/OQdfPlYSeaWQVAP8fPFk3j6hx2zH8CQiwy
         KUN5SR3BWqmzBPf2dWO/s9fsYiWOKNTb4LWE5To/WGI6YVVKBrkLmKiNkzOW1f1rfvvt
         wlOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR7Q5JHubBvyMB2+NFFzv9K5LB92zuLSHkhnB1W5NuAZUFDPPlzT9sWzhmxlsSd0XH/MLKJ6ck1VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8VoNmP+LgBB6eIXmqCFHJkm2QqWOsqLtjgY3IoUx6rttEmGf
	ixbajW6IG4GNzvnTVTQaZPaROsAsNvqGEkZLAzNEtxvPpBmyW3xL7K4p
X-Gm-Gg: ATEYQzwlI/CNteJHZgEr1w0IQEiIOsb3/Z5x/v10C5C+MRQfCUQpHlvghP71Z7Q/JJs
	WBfZUIsc5QGbqRAor/7Wg6P7K5qThuJXgQ4ki/rWwRE6KdGUc2iyOwMA7RNYtUtIDF2xSaYKp7Q
	uLz1IWKRYN0ObY12sLGAQhszc0QbQnCBc6QEIQPQYreUz3R9iTJiuKdWdlQD8Whvsiof0Cm9SPs
	Yf22sUTFVZoAlJDW8kKyNwI9M5SFZuSp1krdSvb7+4img6qcAXLDPx9BcKxcgyypI28tASVSbTO
	vcAVlpYyJOl+aLv1bVeDuaP6PDC1dOQyCOMtsRWRoPK2tIVf09/NGxUGvePQJipOucRLkIB49Vz
	g2aLQ6TncLxjhr1RnFDivkB/gRrIcVG4bNiA6lMhEz/YcDtgptom4I6T0R84z5hHeHmned0vmT8
	sf/A0YvMKPT8LymLupy4d5WqS42r+lJdCnr1g=
X-Received: by 2002:a05:7022:4186:b0:128:d5bd:3572 with SMTP id a92af1059eb24-128d5bd39b3mr713023c88.31.1773023311637;
        Sun, 08 Mar 2026 19:28:31 -0700 (PDT)
Received: from localhost.localdomain ([104.28.165.128])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3d5a85dsm6728418c88.3.2026.03.08.19.28.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Mar 2026 19:28:31 -0700 (PDT)
From: wang lian <lianux.mm@gmail.com>
To: sj@kernel.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	brendan.higgins@linux.dev,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	davidgow@google.com,
	kunit-dev@googlegroups.com,
	lianux.mm@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	skhan@linuxfoundation.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH 0/7] mm/damon: improve/fixup/update ratio calculation, test and documentation
Date: Mon,  9 Mar 2026 10:27:59 +0800
Message-ID: <20260309022759.9010-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260307195356.203753-1-sj@kernel.org>
References: <20260307195356.203753-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Yet another batch of misc/minor improvements and fixups.  Use
> mult_frac() instead of the worse open-coding for rate calculations
> (patch 1).  Add a test for a previously found and fixed bug (patch 2).
> Improve and update comments and documentations for easier code review
> and up-to-date information (patches 3-6).  Finally, fix an obvious typo
> (patch 7).

Hi SeongJae,

Thanks for the patches and the CC!

I've reviewed the entire series and conducted functional testing on my arm64 environment (native VM). 
All 28 KUnit tests passed successfully, including
the newly added damon_test_is_last_region.

Acked-by: wang lian <lianux.mm@gmail.com>
--
Best Regards,
wang lian
