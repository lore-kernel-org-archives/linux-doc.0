Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6012FE056
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 03:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768361142; cv=none; b=r+/slMMeXHxtXCHaE90xdNTqpfmhJhsMInFNz1VYsU/rT3eGaQPDuMvQm4dwfC1QZrSYI8ErAFJxszYtGhLOERpL2QnRfcRp+qm9NCw66eGNpwu+zO1qJXpajUfytID9KMdMG43i2X4Jk2Jl1VdkzTSPeYeooeVnpSnDGlvJjS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768361142; c=relaxed/simple;
	bh=qeyFFUHOfvOf/Lso0USRbtt36V45laqGZKievGEoTMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCwV5na+GjmjlK9t7R3HF3Y6ng24ZHXO4em0nCzO9iqs2Q/nT+bXs4wK38azU7QkCVjwGf3E1YqiRoflllxtOOqJlqT+aHEFQgPSlmL2jj0NoRCcvvduBa/3mitaPyEze80QTtdywi6JbTSYaMJmp8uGd9DVM6n17iMXMV2GFEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGBTo0lH; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGBTo0lH"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-12332910300so2420787c88.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 19:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768361139; x=1768965939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbWLobpjJa8xgEi+LiwpClMK13xKffaVB3M347EXltk=;
        b=kGBTo0lHDRtfeus4UXrpkvez/lsS70AbWAdhs48rYptBGxuNmYGrZs8YkyvWYbuGmS
         Vi4/wqaexSg81WPDCFTBUBb6ddMSmEncg2/uX7wIgh1fzwdi5LTZB6qOo++9FhqZsaDA
         H4kxA8ueSgD2aX3Q7JFuWmu3guEddoSgnetQ4Gh1ZSLQPQu3rWPK/62+caNzHWq7YfHe
         pFpUugSqNxJ6bvJIw2PrZWcE3rpeF6oIxeP/KujEBQVW51eM3BHRsKtD5VXQ9mkAuFNh
         tHj3O6fQo7XJPy7SAsOM5ya8dhXZJTsZ/EAkm6E32cGEDmro+Y/H1AFmZimv0S6dEZWv
         RADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768361139; x=1768965939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbWLobpjJa8xgEi+LiwpClMK13xKffaVB3M347EXltk=;
        b=rFXbs5qhEG0SbVmuWbv3V6amNTWL23s2+0oQ2HDbbVZiRs6moG8RF4JgXPfvILDWDW
         +y6zYKTHlDaxVWJTqeSkKHF7xTzQV5363p80drmR77UesGT24aUdXyzwyrOGhSQxl38y
         TKZL7bZcX80XUJokauCA2QeGzT0hqkyivxRA8/MfkQE4bx9eAcIwMwxU7lGSljX9WSeX
         As1Inll+l1mvxM9xzndkmVT8+v/yetkLZ6eCIbOuRRz8OiCYioCNhsfDWamTG4eWHRxs
         /Gp9hSPuqIbNgGWzpBY6NQnvqJ5czGw0JKYD0LE4i8xmx9F9eZi65vENT/Y4Ehi7Wcf5
         oEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUAcvwUGSQLFSo6NUJLI4NCRCx49xUkZU6vsMiJeMc/4OksgaWfJTHaO4sOCg9AfZYmUgUXqifkvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPghWommzBKW/ylVXzr6nSkRDKUejLNn0+yR0OKWhCtaZmuXr
	Ui/1bqXMIa3KHuisuuyA+94gq34Yex1hZX/da/4c3VVLZ/cFrxyviNyC
X-Gm-Gg: AY/fxX4bx3MNfJL1Og1lFYN2pzO7UIMqT2iDBuTpP1hBwPH0A1G5lQgffWi8L/8lem3
	aGWy+y0G6dS7a1PP2censYfRac1lS1rtG0gcFAljjbhZpq0vT5JPJ+4M7beJ1AoCJThvGZecvNw
	gH5uZHaRCwT/AHaDSKAEucWYHPIvW9F2RrsdUqjGnFcxDedJGAZN/8d1rvap6Op4nizHlP/iHos
	i1mQRY0z0aCHQaedb9gsBRelpqHRo+s7ABXE89dQvu320H93IWELp9nbu2KcDKUZV1IOkHAt79Y
	pGjzkYe1iORYYw61geA/GtvGnnZuP0d+kzNZoWM5ykzLodJFF+eghLH+4CHxRqQ0cLkYjN02W0k
	j4s9DKVWW/2iLBBFACPXeDW8iRkZh/+y2bYPUDKd3YTXMk0F0StR53uovUMobBm8INaxUKmj3wt
	yq
X-Received: by 2002:a05:701b:2504:b0:11b:ca88:c503 with SMTP id a92af1059eb24-12336a33f69mr1176816c88.3.1768361138641;
        Tue, 13 Jan 2026 19:25:38 -0800 (PST)
Received: from localhost.localdomain ([2607:f130:0:11a::31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm29706885c88.11.2026.01.13.19.25.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 19:25:38 -0800 (PST)
From: wang lian <lianux.mm@gmail.com>
To: sj@kernel.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@suse.cz,
	wang lian <lianux.mm@gmail.com>
Subject: Re: [PATCH 07/11] Docs/admin-guide/mm/damon/lru_sort: document filter_young_pages
Date: Wed, 14 Jan 2026 11:25:16 +0800
Message-ID: <20260114032516.83483-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113152717.70459-8-sj@kernel.org>
References: <20260113152717.70459-8-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> Document the new DAMON_LRU_SORT parameter, filter_young_pages.  It can
> be used to use page level access re-check for the LRU sorting.

> Signed-off-by: SeongJae Park <sj@kernel.org>

Acked-by: wang lian <lianux.mm@gmail.com>

--
Best Regards,
wang lian
