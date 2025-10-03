Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E0E1448E0
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 05:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759469367; cv=none; b=eMvKU5ikWSIuRNJ4JAvJEcxSXyPnRh0quK2uJTd0TLYe2bBAPY2ILfUXYxmsfeKEPr4SrCm11GRixVT4dPBJmvipcPOtQL7xTX19KYdg8TsVCoiXvCkaJaQcW8VI8MufiitctWOdKh6UmZ+k8dqxsVGoUgrRkSIdiKA79Wx7e9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759469367; c=relaxed/simple;
	bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWUbqQkGdHDA8Fii6E7Df/6Ds8gocHvdyJ5wfd1bylvErpvf1/bvoytWjzskLatAFF0P/pFQoczQ4HUD4+rzcxbuIjS/4cwyH7FXtixrrsxnZB0YtVY4VL/Q4dxw2ryExGjPozjfHTTxXmCESf3nFAaFKoyObMsNOWlZsL/+X+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD2qZaCy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD2qZaCy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26816246a0aso2352725ad.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 22:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759469364; x=1760074164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
        b=VD2qZaCybeyXJ8ePUVp1n9P2sreyZi4YH+7DUdUxVdU9luMeTDXpTRFuYXdQgNMQu7
         SJ5k6c9WGDqy6Il0GXo8oHm760Fg6ZGUbdT8cZcAEq89Q5LSSd9Cx6KJnLTZpTzZ9H1J
         XS9J68b4C02daCEPTe/buGoPCG+pSUyn8aytbjzPWUpWifaHKGPrLg/zpN1IF5a74MrU
         BBUgzSHbF4l/qrXuwiMt27/oibu3rTGMupzHWfonFbbtvPEAF7ZUqzfvauCbQEAC0vfp
         NQUSY8B8/bQcKpcz5bBgt+QL8WZ0yRnSfd6T7SzVFFZ8FjEfD3x4A5IO593T4hIUxykB
         Lxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759469364; x=1760074164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
        b=ei0XmGxNR9TBRqwdu/LqfnJKfTDQ2Shc610ba5WWbVxwxIYqX9wy+DS0DQUOSx6euY
         cm8mCUT245eJitFFIdY54KWwIwC4+RgH2e4fv+i/7v/txlxqbCFZpkSqwe84VwA956Jb
         MhxhHI5HVCKWJQNnXOyewtb2YWixQ94UAHcGeTDQnpQhKhEwNINLIScPfb/wPWrdY74U
         XjA9GfKjhWtNIX66lD2EAtppPGRokFOkT2UHgNS7ItolAk4OlnT+jgk5BQtYB8WtcBQG
         wZm6yam/9IWZMd2bJjsnAdL6IgtSFfgRVv2YS0iES6yhHT7ySz5URkAQVCbfHE0Qrb4K
         17Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXLNE1v2RYIlErdMRSxL6YnsMjodv4TYbmwzsDeeIyfgYknHYbaCyd6D1YBiF4Mc/hcEHBQ4W4DqyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPATql258xnJudcjrDQcLuMuJR6FZayFZQbpoEGc3yYFQcuuRG
	4L9G8kaa6nVaSJEu2CBFeugQHjzGIHx2y1acIcVGs2Bk86JulJ6maR/X
X-Gm-Gg: ASbGnct6tuCbxd7mhWHblz/S1SDKmixTFhs0AgkYncQMMI5MQhCeaYUXupGnPQqo/qF
	+ing2w/Zpw31h/6bxYZ2EYeQqyBxQNDoa8jQdIiGlHVSmDOY9xhd6Z/3dEA3ZTAhcHKunM5h9GC
	7338qdpJ/JNjUSWwim8xfI19dS65Ty/lewWGv4w+E6O0ofCCyoSvpHmyhAIRFvA9vcF6XVEOmSS
	kDZIliMuKuYC3xQlVsMW9+wMwF3pRrjZVm5Kfey5LPxlqt1Isxl80FuypcgZyi0VjoZ2ui9tynb
	5RdUATuZMSynhqlhvEAP1d98TIlkm7kJZB00VMYjChJ2WqctFAYBgIIt1cWeDrx7gQAsfJ1+YfB
	O+voy9aH9XUjfQ0Jrjtc9Qkz6SUsZdTp/ZT86H1Hqc8A=
X-Google-Smtp-Source: AGHT+IEsmDDtxcH34zrU6yCLvoUnpVNeQpXjkmSiB1AE5fWsJSBu1loqYdfz+O0NGkUT3RQ1Vtyeiw==
X-Received: by 2002:a17:902:c403:b0:27e:f02a:b280 with SMTP id d9443c01a7336-28e9a65bd1cmr12557885ad.5.1759469363957;
        Thu, 02 Oct 2025 22:29:23 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1108b8sm37676925ad.26.2025.10.02.22.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 22:29:23 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: seakeel@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexs@kernel.org,
	aliceryhl@google.com,
	benx.guo@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dzm91@hust.edu.cn,
	gary@garyguo.net,
	hust-os-kernel-patches@googlegroups.com,
	justinstitt@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	si.yanteng@linux.dev,
	tmgross@umich.edu
Subject: Re: [PATCH] docs/zh_CN: Add translation of rust/testing.rst
Date: Fri,  3 Oct 2025 05:18:49 +0000
Message-ID: <20251003052826.454550-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJy-Am=pC07CAWgRSTJ6WLaBdYeg8LQbVDCJp4PYoHaikFJ4Bw@mail.gmail.com>
References: <CAJy-Am=pC07CAWgRSTJ6WLaBdYeg8LQbVDCJp4PYoHaikFJ4Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2 Oct 2025 21:33:59 +0800, Alex Shi <seakeel@gmail.com> wrote:
> I can't apply it after your previous rust patch. Could you rebase this
> patch on my tree?
> https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/

> Thanks

Thanks for the feedback.
I will rebase the patch on your tree and resend as v2.

Thanks,
Ben Guo
