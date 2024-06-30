Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CDD12D1F1
	for <linux-doc@vger.kernel.org>; Sun, 30 Jun 2024 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719741169; cv=none; b=ppGcZH8kTjGD05+vQoLUnrRBtk761Fn57L3kb2oCnKrgKmJujeicHmwa7ReFgny9XUApFk7Uzrpadowob9ybdECR9SUA+CmYO8OjsyzcyW0hEDZ2Jf+BDW75Z2Vt4hliKXKgwpdltgg09xGJhn6BupjqVbhQ83yttlpjXsdP1MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719741169; c=relaxed/simple;
	bh=XYs2F2fuQ5isjj3Oex07FgB8+iDaI3aaav5lUryI/YI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IKX+I8pNwlkSSolEGAAVxdHUNS4Z0CttMgEdbjTtrPvumk7hk3Hd/nFuuDczkoP+WZJ989xZNG0g7hnlr19iB/mICR9gxseFFXM9tVCJczvf8b62JHzH4w2MaHhiqYufvzOU7Lo92WE/gRJD/tkI9eRkiGCRTZ4984rAYQdFwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BrWpUgzf; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BrWpUgzf"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-375fc24a746so186365ab.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Jun 2024 02:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719741166; x=1720345966; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iccxi3VCjgIDcjdU7CNfmHIM1EGkZVfk8wVtDoAI0uw=;
        b=BrWpUgzf6eG8RSRQcBEGMBB+kHT/pebf2hr6d2n8bv3d72ujaKgLBdIlG9fGidYkGb
         fnIsoTxLuwHNPyCZ0wieLkAzCJMB5aNIBNhuMs1dskuWSqK29P6CkTyVi+/aGSgywOol
         Ega/bH0xPposqO0UuMhcMMS+36SqApMWfCRuXi5ikAkEUo/Uf4pbjJABuOfoE+TI9Ii0
         ohkxcUWdlxrJXq3gArit7nZcgr+UQcIcXzKSGnPex2wxtWpu+OsKgS1xM2mlpMJZSG1Q
         I0oMJNdADCH0r77lmaCPzsOKJIq+VXxgMFfwFFOj7TSRwdUqQBiY0ZqY/JfJ9qCN0PiF
         GhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719741166; x=1720345966;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iccxi3VCjgIDcjdU7CNfmHIM1EGkZVfk8wVtDoAI0uw=;
        b=aLKpNc+WWMIbuxujKNBhD8ItLE6SlV/wmGvwIdGJe1QgWi5EcZ2E0eocyTl/P61iOw
         e1BtWcqMeKmLf775KuqpruFUzUyFt5XkMPzNcy7SYTVdRJ2hQYAX3QYnBue4SXnDvQW5
         0zFlr3ZDp3ZrZvyqtJeWWNwACs0UM2G2fCAZ2PNgyCVIEWYbKbyYQwUEvql9ma75gKmW
         4Zw4OlntoUamQfaiNd+wyql6rrfMH3Wn/0vsQGrbiKIp99INKov28wuQG+TDReHA7/qV
         hGIY72yHMKoJmTGd6ox7F4MzsPBZ3BXqV4ZAc/dtzk2fMWzx3//sEtidFc++F6KAKrrK
         RYOw==
X-Forwarded-Encrypted: i=1; AJvYcCUnYiK9PDCVE6lY6kyhK4fiSre9L4SYRcVHtBnigx1Fukj6ShHvq8UpDl6+3m/J8Isfv10lg2EBlF5m1u+vfkdyR+OMEuP+dUAr
X-Gm-Message-State: AOJu0YwPImu2Uwob8E0jKxKIG2kAhVY1osebQjDI058X+g7xIYGZlXkm
	KF5eNrkEcswgK8G0MWpFk5oRaMWFoyCIZbUQXpCXxd4c0+SK9GU5E4TxqsY5IA==
X-Google-Smtp-Source: AGHT+IH8tilJGUqSrWvNkiq+8XKCazPPL41mBEsUotEOogcY7qZH2CcIW1ARmw5TFzw6cd9DGX5djA==
X-Received: by 2002:a05:6e02:1d06:b0:375:9aad:114a with SMTP id e9e14a558f8ab-37c3ef9ee26mr2639095ab.26.1719741166592;
        Sun, 30 Jun 2024 02:52:46 -0700 (PDT)
Received: from [2620:0:1008:15:66f9:a021:890c:52c9] ([2620:0:1008:15:66f9:a021:890c:52c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d41655fsm3488624a12.92.2024.06.30.02.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 02:52:45 -0700 (PDT)
Date: Sun, 30 Jun 2024 02:52:45 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Jiaqi Yan <jiaqiyan@google.com>
cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
    ioworker0@gmail.com, muchun.song@linux.dev, akpm@linux-foundation.org, 
    shuah@kernel.org, rdunlap@infradead.org, corbet@lwn.net, osalvador@suse.de, 
    duenwen@google.com, fvdl@google.com, ak@linux.intel.com, 
    linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 3/4] selftest/mm: test enable_soft_offline behaviors
In-Reply-To: <20240628205958.2845610-4-jiaqiyan@google.com>
Message-ID: <fa853934-5820-7168-b075-926ede1d3959@google.com>
References: <20240628205958.2845610-1-jiaqiyan@google.com> <20240628205958.2845610-4-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Jun 2024, Jiaqi Yan wrote:

> Add regression and new tests when hugepage has correctable memory
> errors, and how userspace wants to deal with it:
> * if enable_soft_offline=1, mapped hugepage is soft offlined
> * if enable_soft_offline=0, mapped hugepage is intact
> 
> Free hugepages case is not explicitly covered by the tests.
> 
> Hugepage having corrected memory errors is emulated with
> MADV_SOFT_OFFLINE.
> 
> Acked-by: Miaohe Lin <linmiaohe@huawei.com>
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>

Acked-by: David Rientjes <rientjes@google.com>
