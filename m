Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195668;
	b=sEtlZclEPOJcwIkJ6RyhoYJN9xhL/lPkQT4xULuoqtQg6cFJMTBiMN4+howpNw7ngHj9
	 Si9F4eVPlMNnA9iy+ptHjJyjwuHZoSoJwQSqW0azcL7PzPjbNAj3FsMbv83ZnKYuLGhzj
	 90C4LxSbYiF8R1zYJm95llR9RZF4IcXg1QU2qOujHHe2+b2VXHC0OPAv7m7XqRiYjobwu
	 DBPd+r445UJdIuJ+lGusjO7rzgr9BbZfyQRPVH3PWGAb12th8x/+29fZ0oz1zSyepIC9U
	 SN1uBCax5MldaTd1a+Qpt8Hf32XmN/61ASGB+pPSD4fLidJ2ibLBZr807RN7eJWqiiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=;
	b=xdfQKQMoUABgfGIhdmFkDOjO33xJSxqjdTaDBn6QM2mjY+W+IztfPtbiwvUexsARTADh
	 Xg/bdXDTUuCIjsNIUAkCny0l8Hql/wX+E5ffvSXiFSRVg42fT7+2gyyC0fvS7qKPQ5Du8
	 fUva3eQeLUZ9NlwcK3E80AVW0QXYZsyMvfNyahvIEcS6ocViGsmFMQUMfsmM28tTKDsLH
	 GNWlSCXT3TgaM+Rr8VLM0STffsLVqRezM6qsLbUlf+uTO/X2yU+s088dT8+qmwnIicB9a
	 qkcfBoyxPcJI/se4Aon/NGN+nw3QHbW75Mpl54loTJhetuygmpMcNXjBMIpxwv0+ZBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7d1Z3rc;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EFA606A32A
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 17:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4EFA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7d1Z3rc
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-86103aaac12so1361762a34.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 09:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795195666; x=1795800466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=;
        b=r7d1Z3rcU80Ftfsq8u4pPrTWtL5a2QJWqXuQn0sj5yw3f7cL/WZIG5XkJqNSOm7qff
         Fa8lXfMkaa18EL7CIrW/qCDwpp6ppb7YhXJWhKglUiMkyISqXdbV5etgPGa8r83fq3Wf
         jaNDGMk9n86YtTvhK54DUNaoGCJB1NSWlmeVo/49RbzwcdruJz0q9d2h8MfFncGLVuOC
         kNcvMS3t/mU+onD2BPtS1Bx2k6dZsaYrkbzaDUhkoWfsUQjkcUYe9XYWs1p76wbLpqGB
         5UfF3zsUUnkQEztUqvvSSS/U/rXiO1/8yM/RA1ayotKkQu8k1ljxL9kqhCX84QLJg4p4
         u0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195666; x=1795800466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=;
        b=nQlLLwZ75mbUcusK/b8kItoorB74JIrNi/oq7G9ikFMwZh6K8rGgDNvgTxZMQbPJQd
         SEUFxv/hNBuKoEh2q7owveXI1bjm3c+FunPhDeYTdN05X6VBJg5+jA187HUJLo8KFVej
         XoNhB6rTPrNfj+V9bs6qtJqvm/SQROdsL6219EjbDfC68UzAxxqYxa2ys5Wm7l6RRHkB
         t2niA8HThTFsqaGZC7M2GgidBSyhzB6+cLQULqTw+a71fB1Cp3SJJDP7xXZSpj74kOhm
         bQEFsSk1n/DHpNBGh6JMDCbP31rlqtuwwj9awsCT4KgSRMbHMCEzf2sOYOLhz+MuEemC
         zvuA==
X-Forwarded-Encrypted: i=1; AL+hErF9bE5a3TUBAo5Jqs1yEv39W75ReTr7t8TUFwjNN8n0ckNKjVfs/Cy18JTQFfxCBjWmXTya3qO109Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kIKbOFF66D5B/GuzArFC6oSlnYZQuh+9dmJXWG4xiDMfWXJXM
	IMSJVekHmX6lXjLwqHDdmW0+84wWlJ2mYUYl3U+/FEij41eGIVa2wbkl
X-Gm-Gg: AYBFou1qHNXN8Y+Ayu5pRgSPnfLbKQdFfIdPKrMgcw2nK6nfkD2uV7+diIkqMBeL7Kg
	KNpZP2TCmDAe743GfElkGAVy0lo+8Rsf5fAChfKG+O+Ipx8VUtWKqrDlvQrOf+P2vNlExAOyUZ8
	M4zfd/hRJ2yi1T/cTpm1TTLZ9x0QwodtEzd88L0d6tQvkN7664enPmAuDWmYXcv0C4E/QyJDw2Q
	IDwXZwowsAmupwYolDXRe1ObqClyu2LnHaeLMTmbUu/cUNe/XlZlCHqD/la7uxnNeNePsIDEGDk
	BGY4zFAqOgXJHrYZ9kKmunr2g/TxiwEMQfFLvaC/zKm8uQH65DRyh/lwWegwh0mio+zjVqhZwlO
	oeJSDsaOK+ZsiCzWN8Mjytc8Mqbttb+KrNViMAzHnTjNeyPjEnESb5hT1XNocZyn0J8BQmTHdbC
	+ZgZ7mHhUm3wHHWJ9MXcAo6OlQgzaWSfE2pdy7EEhE31abi5hUM8PPn9W4saCjTvm32XmOdffxH
	/2PouyROBtOIOauBQCN1UEIQfUjb1pflx6pT9kQBYFptnk1kdqP4j147YOkNOTGtmXYtBXR72pc
	20r+jmI8bIc40CJP+VT4oBA=
X-Received: by 2002:a05:6808:4f08:b0:4b8:46e3:e223 with SMTP id 5614622812f47-57a0a113076mr2651142b6e.15.1795195666573;
        Fri, 20 Nov 2026 09:27:46 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm2473520b6e.9.2026.11.20.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:27:46 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Suyash Mahar <smahar@meta.com>,
	Amir Ayupov <aaupov@fb.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is throttled
Date: Fri, 20 Nov 2026 09:27:39 -0800
Message-ID: <20261120172739.1843303-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
References: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 16/10/2026 14:46, James Clark wrote:
> Reviewed-by: James Clark <james.clark@linaro.org>

Hi Suzuki, Mike, James, Leo,

Could this go in alone as a v7.4 fix, with Cc: stable@vger.kernel.org?
It does not depend on the rest of the series and applies cleanly to
v7.4-rc3.

Thanks,
Vlad
