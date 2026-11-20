Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183972;
	b=f7qx3nrfXfI1w9P3BhqbfwHXKF6LZB1W9gEttm9kNer0BUeQs0XzHw3XgUAYMR9gZpyP
	 NoNtAJUrcIW5UQ8vTZhDFNKCQMpfgNdcBaauplo9YbmQt4ZqV0AqeTWqKnb5xJOM1FWEI
	 vZFucbsIu1zgFf5JPLhzkMCp64c6pUTVHeOacIrd8Z0otM0p/79vzoqsQxMAc83aRPHVq
	 VcBvoDcnraFfgddNh6Yxyt/mLclyPbOIXuquWpG7KnnNYitT7TwayplzlnO121eElVYrz
	 /TxPOduCTYv2Olv417etsGP7nVLGOlcuBicn55dHtm8ciFra9bTBacYgs9YY22zIo7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NRsPqc1sWk3utVGhpgkPro0yilWSwaU21f7Ua9Mar54=;
	b=SdVMg7sLnbz9xHJzny5yg+54cplcOt49GRtTho8NC2jPgA484JTfwv0Ur5rBUjCB5GqG
	 3Z4aLtEBJ1kXHFr6NgxFqa6SxYwQWcPQPR5i1rNOwPeAM/LEZzUAz0jRVd9PD9/tTIVtc
	 aFrx3oF4GVQA7u7RM/+h8eo44h/Yl+jzZ6ECCzEFp0mIDJiSlRh+2IpdrbCi8EE0j2hXq
	 FAp30GExcls+/VwiBI2HsmHUlDzR50QBkzZJtAH4qbusG1GW2Drd9lg6CncjmamGy3psc
	 VOQzK5foOYwpxv5eO5CWwMmVNEivbL46+ORLpzDunCcnWUPLkTmYESaionZhwPQWMHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=Vj9B4OJC;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5DC606A326
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 14:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5DC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=Vj9B4OJC
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380b40319bdso1181670eec.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 06:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795183971; x=1795788771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRsPqc1sWk3utVGhpgkPro0yilWSwaU21f7Ua9Mar54=;
        b=Vj9B4OJCUx7qGlAZwrGAGT4KmwAMBHbSg6b5zwapZ0p40mZKAfRs5eAsuwDTA7e30B
         yKCQ/cNph7+X4ud8ongTzJoM0atCjo5+mi15Ku6j0v2eAWqJMCrtil/ziDteNySh1jnv
         KUTKOatCOs07B2djKWsPFisBl7rC4P80qmHE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183971; x=1795788771;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NRsPqc1sWk3utVGhpgkPro0yilWSwaU21f7Ua9Mar54=;
        b=eomI4I0pTTwl7Gv18M2QlgD8ac41InlhOUqis53HvKVtkejGwRPwiJTrcKIQCLed78
         KlXftYT7Cmoiv8SqiRVriLhT+h7RMFlkeZf7CKHFNjhEaFi/qW13/HyeSmDOTqnmnslc
         Mljbf33QkvY2+viOSphFbdEjhMz6oL4fgk3CXJ57BwduBhzFbECgb4RsmlrznXfLeixn
         VTst3dgTwh+jWriHvUpIwnILhZFk/CyNCio7wPmGy2bqMSO0rba4K+irmsTNQBR/i3Qe
         9pbJA8KAHG2uU9tVw63rSxBH+qnha7GQj1/qrkGH81H6B0gxq0X2Br2jYglvYuelQrpe
         1UqA==
X-Forwarded-Encrypted: i=1; AL+hErFZM7lW+SqekUCDZaQLxLDrPepn8njzd8yI4kWUNWyQDMdg7VnehIbME55kW5qs1zsuDmWPWPWWWNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZTtiAN3Zpl2m5HkohHVZ+Hz8eq1JmBJykW/zB76lOnDkcIDoj
	PqYXnw/MGQwjaX/Y3d580qldgW7ACbLLff3mXPH/sAS7pjPdX6xG3QMIsksggiX9Khc=
X-Gm-Gg: AZFdTZdm59lFuwMLIze3hoBe95V2qwtGA+2KpB6+QDCbmi1sMz+I9kMOYKVqhAIhKEM
	na3cSwZlTdK2Wptw3Na73WB5OTxRmmLpYUmafpkcKuPpP6/hxYtcdqr4/F6VTvTFfv9jnK7q7ju
	8hZSiLpnvKplF6qX0UfZme4JDBOk1e1zvpJtjhjbU/oM+bs98UVLpQtSZbplm/c1JHEU7U94FsC
	atM19wHI4VT7r09PSydaB+a+JwR7Ej8Mmw4+40dbAOucNNer/UVzh5a7uVCRmDp17kXIvgJXcnr
	86Zwpg6jENkOTavJ6sZzDTDOKuTnaDGfLSlRmQpaaQpTZt3ffLwDlQMaXPfGKSCKutGKhq+jIZ5
	2XLgAMY3xI/KkGRURjIkprIZYS5rHi+LGg4kkdf9B2Nz/c32ABDKijgOHKJX3cdRBtdtG4bszOu
	u2HKEL6IUWg4cIoHY2Yew9+bW6NufO0CT7H4y4P/kHa0qzXxMOq7/OlEGGp4dA7bev2OVW086Ww
	c4OALNfjfmTTFc7KYIQPESFvjh5zKCyWiArIm6eNDvHw72Y0Aq4n16vMbcHdZOvOlwoqWuvG6SY
	QtBSegPOZv1YtB9Xvx2264ztRmXQq3z+ldgo0qaMn+7/3/rdm7/DdSpdslXoln76Yp117CrRhDG
	wHG0qatFzf42u
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr3507628eec.35.1795183971339;
        Fri, 20 Nov 2026 06:12:51 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm11244434eec.5.2026.11.20.06.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:12:50 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v6 0/2] accel/rocket: Report NPU usage through fdinfo
Date: Fri, 20 Nov 2026 23:12:23 +0900
Message-ID: <20261120141225.789350-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
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

Report how much of the NPU each client uses through fdinfo. Patch 1
exports the runtime the scheduler already accounts per entity, and patch
2 uses it for rocket's drm-engine-npu key.

v6: Rename the getter to drm_sched_entity_get_runtime_ns() (Maíra
    Canal). Report rdev->num_cores, the cores that are bound, as the
    capacity instead of rdev->max_cores, and skip the key once no core
    is left as a capacity of zero is not allowed (Maíra Canal). Add
    tags.
v5: Use the entity runtime from the new drm_sched_entity_get_runtime()
    instead of a counter in rocket (Tvrtko Ursulin). Reviewed-by tags
    are not carried as the accounting changed. Based on drm-misc-next.
v4: Single drm-engine-npu key with drm-engine-capacity-npu, and
    documentation (Tomeu Vizoso).
v3: Add a rocket_engine_usage_create() helper (Gyeyoung Baek).
v2: Size the per-core counters by rdev->max_cores.

Link to v5: https://lore.kernel.org/all/20261112171144.3151554-1-sidong.yang@furiosa.ai/
Link to v4: https://lore.kernel.org/all/20261103155338.1949294-1-sidong.yang@furiosa.ai/
Link to v3: https://lore.kernel.org/all/20261103104804.1887489-1-sidong.yang@furiosa.ai/
Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1-sidong.yang@furiosa.ai/
Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/

Sidong Yang (2):
  drm/sched: Add drm_sched_entity_get_runtime_ns()
  accel/rocket: Report NPU usage through fdinfo

 Documentation/accel/rocket/index.rst     | 29 ++++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst    |  1 +
 drivers/accel/rocket/rocket_drv.c        | 25 +++++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 5 files changed, 80 insertions(+), 1 deletion(-)


base-commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
-- 
2.53.0

