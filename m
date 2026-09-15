Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB41258EF9
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 02:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440939; cv=none; b=JTXjpo97bWaMSIODtDNJtK83pBx/z4W5Au2WIkDCy1Xdvnf9FDJ3nMhHUp9mp27uDQBEE7w4OTYfxHukJHlAyRYB3VZm1glWHwYSLegovZWjPxuSkLZ7qgUWyMVAnF/qCpEN2YtIQNJgdyyoTnFMuZBU6/mfX3710aDjR1c8prw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440939; c=relaxed/simple;
	bh=136EN4ADhppTSjdnfWdxiOC89bNO775Gf/FZTu/DZWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyI8o+CN5eR9bCJujp/RMTS8n1cEaFky1O8wZLkWSMAEEiERVfQR0/RN7boJzfl1bywJsHszVGDAB/AqfCBZxfOGWxy8kjlxzwlsrqfH/2NqXZdGuASheJD/sjkYuznMJzxxW0/t0FadDEyYJIS20nG2LwbLqddEtp82XbTiIE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn34eGRg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn34eGRg"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91a931f66so15612815ad.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 19:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789440937; x=1790045737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rONIJ4rFKQNYtEnPGvXxCw20wCu4aJ48o2Acfvenuc=;
        b=Qn34eGRghCMexsn0D/tzEpk7+645b3IyOmwFkxmAgSman6ewK79D/+XIfZ4AGfHxc/
         4hVdA3Ujo2HTMusYqNzrpplV0f1A+aHB2+0QoULy0cQaMGhSnt/nco/gTBJHVdzXJbgR
         /mc43TJXkbVjaJhwz3CTdqBx9kwFbK6+q9ubD9Ymlohy4hMYGM+m9FTidRKSO7VS4AM6
         9KrecAY1eiZ5h1zmw8HulGS9MSXpaW2sVEcha+6Jl8ZDss/j8DA1sQvRGBWT23qVP6y+
         utgh1iT0MDGfzDS5WPp1zlj2u5C85j4MjPRrW6XIwIIoqclXY8303FJHNfqKxAVs0q6H
         a0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440937; x=1790045737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4rONIJ4rFKQNYtEnPGvXxCw20wCu4aJ48o2Acfvenuc=;
        b=ex4Kp91/9+WOSVIpRXZuKNKYAFizbDtotUGTKbVT6W3S46TOULbqZK/oORfOzHNwfO
         lBBMinDzAtURbh+p6XKyuESUUj+25n4Q/su1/EMsbj20oHR5PBwGKa6qJDv96nbsGzW1
         SUH3RqIv9YDtJ0PiwltiE+XMdE4DlWlpQJkGbUT4dVLIe5KxoNHxVlnqh/zwzeN8UFfs
         xmOqdawwg4bVFH+Y0BtAmDjj/nuctLzbj2kWlEcjjpQxB13vUjn9UEII7EtMbq/7y+EJ
         5930fZn5qRJHjSsJydz8kQXfYyl/BEJrgibzn4BHDbrslNCSfRnrxL9vw8Ikc/oLQqyV
         n1jw==
X-Forwarded-Encrypted: i=1; AKwUvBzbE8DfglEcXedIZn2qz5OcpveajGJU4wVLg6RAkSscePZAW6cxKo2FLtnX/rrFaVCshMTn+aXv79o=@vger.kernel.org
X-Gm-Message-State: AFuF++lD8NVHuGw8Rysxrup1nYVZMEKWWjmSTMIVOMUOTdy0W6E63vAe
	39gpRl5l/q6KROf4oArw2O+ZHD6pReGAXLG9bA4ListP3KLQRe9m3M1O
X-Gm-Gg: AYBFou2NI7CS8EMJSYtMAIEND5wTQBQV2HopxWKlkvLjNJnCIKPAMQVuR/sYI6Xlq3N
	CAThmLp2gzz8UiVMueDhPGDNYEGBNr5sToyv7AdhG5Z7HQgURPK88U57mSGwLlTUA7R66m1rd6H
	q7AtL8ry/5Nr5pg/bhZacQLImcq854kAUbZWLhUQqqjQv+ExapSUo+/ht4LJK5FEyQzemggjjgd
	POH/BvE9Sgi5rMFAroiZ825d/FZC+lfBySFyxZ08G2PVf4fifokhWIDVNFPSeXH5tYhngLqB64c
	Mkv9FPjVUbygdmYH4cF9WzqYrzbZgzrwUi5ivPdNo0xJQPcuQp0GZsTyt9Izlbdml6bz/73WXU2
	HRaSNZU4GSvbrwrfZD9cNI6OgeXrkMq0GvxQ6sEv5XSSPIDclmsRNFnzPH1Un5tQCat0HYmnStM
	Nvnx9kFp//VLP2LWu3J92A6IK3OH4Q98GVsSRmpWED2P7C0UM3lwwZfjMm76yJ+HH2eT78f7zCr
	igVRZwWUUbQZm+HSsTOe/dLqjcZ2hYlVY27UsW/
X-Received: by 2002:a17:903:1ac6:b0:2da:e634:370e with SMTP id d9443c01a7336-2dd6c6eb5f4mr114307505ad.14.1789440937165;
        Mon, 14 Sep 2026 19:55:37 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb7720sm57859485ad.37.2026.09.14.19.55.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 19:55:36 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>,
	sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	rientjes@google.com,
	weixugc@google.com,
	jic23@kernel.org,
	gourry@gourry.net,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: Re: [RFC PATCH v2 0/9] mm/damon: hardware-sampled access reports
Date: Tue, 15 Sep 2026 10:54:51 +0800
Message-ID: <20260915025514.2434-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910171623.6638-1-ravis.opensrc@gmail.com>
References: <20260910171623.6638-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>

Hi Ravi and SJ,

Thank you for sharing this work.  The report path looks potentially useful
for a DAMON observation-granularity problem that we are investigating.

The scenario originated from an issue reported by SXF, and we are planning to
share and discuss it at LPC.  We have now reproduced the underlying observation
difference on both a local PC and an x86 server.  The server run below is our
larger, controlled reproduction.

Our test monitors a QEMU process whose guest memory is backed by a shared
tmpfs file.  The guest repeatedly writes one 4 KiB page in every 2 MiB range
of a resident 48 GiB data set.  The unique 4 KiB spatial coverage of one sweep
is about 96 MiB, or 0.195% of that data set.

Using vaddr DAMON with a 500 ms sampling interval, 20 second aggregation
interval, and 500--2000 regions, two opposite-order runs reported a mean hot
ratio of 1.751% without shmem PMD mappings and 75.836% with them.  A control
that writes the full 2 MiB ranges reported 75.366% with PMD mappings.  Hence,
in this workload the current observation does not distinguish spatially sparse
4 KiB activity from dense activity once the large mappings are present.

We are testing existing DAMON strategy mitigations first.  As a next step, we
plan to replay recorded access addresses through the report/probe decision
path, independently of a live PMU, and check whether DAMOS can distinguish the
sparse and dense cases.  In that experiment, raw report frequency and unique
4 KiB spatial coverage will remain separate quantities; lack of reports will
remain unknown when source coverage or loss is insufficient.

If the report evidence makes the decision reliable, the response we want to
evaluate is an internal, bounded PMD mapping demotion (splitting the mapping
while retaining the underlying THP folio), rather than exposing physical folio
split as a DAMOS action.  We will first keep the response stat-only and archive
the would-act ranges.  After the replay result is repeatable, we can replace
the replay producer with an appropriate hardware source and share the results.

This seems like a useful consumer experiment for the report interface, even if
the vaddr and optimized transport parts belong to the later phase.  Please let
us know if this direction conflicts with the intended report semantics.

We will share the strategy, replay, and mapping-decision results once they are
repeatable.  We are also reviewing and testing this series, and will follow up
with the appropriate tag(s) for the exact revision if that work justifies them.

Thanks,
Lian

On Thu, 10 Sep 2026 10:16:14 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> This series lets DAMON take its access information from a hardware sampler
> instead of from a page-table scan, and lets a scheme's score be weighted by what
> that sampler reported.

Sent using hkml (https://github.com/sjp38/hackermail)
