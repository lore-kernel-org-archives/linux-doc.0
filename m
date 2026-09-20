Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D9444713
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907118; cv=none; b=G7S7dTgar4U25uHxp6aN0zYe7/fu4f5oABamC4/M8DaVUvjhmuNddz/lM8nh7MQEl5VCxRBbywXw9Vz2ILeoBJDWz5L5Rnu9wSRPcfG2v/Z/mNSh64I8tM1/iJc1B1epaRVy0vOnm4aPaFZ0LUGxs6W+G+nQLrG5l/WgklYE/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907118; c=relaxed/simple;
	bh=OG5lCEUgYa4YxqH+9PDo4SHEg58BB5hNYIqEZJkrC9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRY5wZRalTVmmD1p3d4S7Q2C6PVngi95CBmAwzTGpfX+X4vqIxLdeM1QVNL0SgpMMkYu+BJR37t8P0HalZJptgcSlTPMsTq8ASsOJaF9SGI+ZqXrLWC6XoESVuLVbeSeYNctYCK+agTcaXS9+j1bG1P04Ar5Dk42mGypXyQretw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOvWtYdj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOvWtYdj"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso1427358a91.2
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 05:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789907095; x=1790511895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpdMVsVBLYjzWDTXbQjKSYrSvCe+sMnBTBU+TbdKtJ0=;
        b=tOvWtYdj7MkzM/Eer7eZaFdSnamAHoUIROCc6aLM7FzdNA/G688Gk/fxoTG1dQFqm5
         bpyS5Zqmi+MOs4FNn5jyKXOQPgDlhrKuC7wqw05sROKbq1Ht/XTq4NoM+R4LILxWMzZy
         Rt1TkpZV8Yt0MgF2/QSiBRAMbV1TiF10txTB45P2l47kjU4S1Q+iXlWCgC5855eydqAV
         C1CEISh2wZj2pzBP6387nRU53qDFemlyFsYlTDRlOHR5ELFT7CCTv4K+t2vnWYuG7DkN
         Mv3Jx3VSHhzVYaAGhYexihV5T8aZNWDK6BZNr7pr8sObpArHh8/AQalaDRF3+nIF8pr7
         9xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907095; x=1790511895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpdMVsVBLYjzWDTXbQjKSYrSvCe+sMnBTBU+TbdKtJ0=;
        b=2OMj5DsCp+oisH3t9NujtGVnnVXeypmfibGkjntogttegpDUSWdnAht/3F2jn8eZyU
         GnoFT8/dbRqk6pkKj1Ndpwwioftz7pn0sgWrvctMymq1pa2C+sMwLZ/uC2/zFBlwoptV
         t5AcRr8iALrb7mwVQ7ORT3Yuht1IJPkWQBA9sQDHuUhDSNO+wOiZx+1Jczeb6z3R4yso
         Wq/ZaYG4repzJs44IWLmjt9Y04528H7kq/WH3ORe0t0TWC9/3Q9Xf9p1spwcbJvHPDLS
         bYpip1U9bYyoUs6uFAwklFXp7UmYPIMI/eVFjuJJCYNgiixGfjZrK1vOFiwtp2485qbE
         8MsA==
X-Forwarded-Encrypted: i=1; AKwUvBx+mMoiXWJJxbR1fVnyjKLfvJi0DBOKeDra2ujhY4hYcxTR7RkXZydMUpf6Wz5AvAwVM6wU7ngNyb0=@vger.kernel.org
X-Gm-Message-State: AFuF++lTDxXfd9G31ve+UUYj5bSEN0K5BWroXWWfHIlJ3X2d1ZGzfDbD
	aPTSZnDi/JE0uVb+PQf/QctkELcJlKU3pzNkPMkaf9eyngqgnnp5zjI19G54Zwg=
X-Gm-Gg: AYBFou3+BPCgcJw1jOFBc/5VuVHnPRgbEs6CUOPKeP3P2zKT3mZA4buhkPlRys3mRNE
	h1cXTD68DqNJsvub8odCkymE+nm1Kz0Q83d0+/qXEtKg3Pq+qrGXrHqSFr1+9GHSnFJpgfGZZBP
	0qJCKRQi9vDYCUmEEu5pfd14yiI9IoPH1s6ra/7f9L0LGtsNQ1RznFTk09Q6Jq+ohAJPd4+XD6i
	eHxgQAvhgQ9a4EFXms7siEZjxNTQHlHZ//DlnjPoanXyRNHGmhqzTv+sqx5j2QqfWuIZr5d386u
	5whEVTJi/gxpaPEEKwJYNcPfAcl1Omcn+VtbhK+C4lFxHojEUgMnVgsPbTS8vRKAhnflZnZoGHY
	5WTqD6+3p3UUg/rzGXq4MXsrPcmFsHIUwC1k80Z1lTUc4/pjj6ZjXgN8H/ODQ6rq5pop7hh8Lgu
	mFnVuQCeNvlrmU3vhjZq3C5/3ga8Sc2GRR8P3pVA5ERMvlQpAqCDvu1KDFS1gGPYzsWTbxVtDVx
	6GLiUcQfd8hr94geGUr4Ki+fck=
X-Received: by 2002:a17:90a:b82:b0:3a0:42a9:9c82 with SMTP id 98e67ed59e1d1-3a042a9a040mr609569a91.43.1789907095575;
        Sun, 20 Sep 2026 05:24:55 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145e5sm9445857a91.5.2026.09.20.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:24:54 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v2 3/3] Docs/admin-guide/mm/damon/usage: document the temporal tuner's quota limit
Date: Sun, 20 Sep 2026 21:24:48 +0900
Message-ID: <20260920122448.610319-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920104921.48065-1-sj@kernel.org>
References: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com> <20260920023111.2466265-4-donggeunyoo.kernel@gmail.com> <20260920104921.48065-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review.

On Sun, 20 Sep 2026 03:49:20 -0700 SJ Park <sj@kernel.org> wrote:
> I now think this documentation change is better not to be made.
> Correct me if I'm wrong.  If I'm not incorrect, could we drop this
> patch?

You are not wrong, and I agree.  Dropped in v3.

Thanks,
Donggeun
