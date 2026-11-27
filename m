Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797103;
	b=wUGfevPl8MLK9WnWvow1rY3lY0156whIJWg0cHMLRZoHpwsZJtUQW2wwpwML8oKufAlU
	 zN0cS/w74qGrfd5YprTiBzEmRKuurDT5LKe4TIJWvyp7mjfVZxneqyrBjiJ872gHpNrlu
	 mNwOly0f0qjaOzP/4Jb62X6DaGg8V/RVxdMpaTJqhIVT7ITqiDHNztVv+wLvnkT7HSJiH
	 Xx+p2Sf/oTM+rPIJCWjXs+Q6fhhYCxVM5ijRumvf4HWN6PoaE/0d5WJ8PG53+pd8zx493
	 0PBYzDkk3+9oFTawT3zfs5tFYLwAOyfDV60WrWvqjDbcAEfcNHHdjdOvz27QjATFnnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=;
	b=4oA7m+XEnYHCc1298xILxYRyaM1jQg3n5M5xnDKONmiPAeM8zyZLptBL/sBLez1WquD8
	 spDJNxkK9m9sL57fWdmK2Lo7tNT878IK+KSPIhzDX22uFRJlQzl9LyLCNFslIsWTgsX4R
	 aZLRnL6sF+tYeXIku056z/dNI38P7PmWUyan3hc7cUKWnsACDBasyAsa2aIB3dVg4ROHC
	 /iIMpkCj4bvnPGIx3XLENMALSkMrSwMCddqmBDo48VQ5uNvauP3HCoO1a+gcd1k2KduCZ
	 iGrb6uql6df1AvPhGOiwmwjCZG6jA6qoP7JItiRSUwWwqGV+8MGPDvCnkFx2i22MpnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p41YKBnh;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45CD606A31C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 16:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p41YKBnh
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso2850581e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797101; x=1796401901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=;
        b=p41YKBnhuyOT+TpvRIHrMxScjBU7bBWKCDfLL0udUkj50hiYT7nd821dY/PTgq6Zqz
         YEgrBb02dHDhK3M8p7WSqluOSGQ94A/hj6um6azi8xgzJmejaGASDlqysDAmUnqIuw8E
         YTAr+gTmSk+g+TKbhv8+qD/tqAklezgjEbwQHVkwe0iQ8/m3qBaQavkXPZBH+NDykzyr
         GsZWI7geCD3MmYYglHrpPSrKlWnZ/y7Gdf8QGZjM9mNuiBR4OvIUI02U+wEDWW2wFJXu
         2GR74dMshWTG+CAgfL+L5QXyjaB2nVMXUIj1nl7jfccm7WQqAdj0hXei0CLhKI1gzf6p
         f/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797101; x=1796401901;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=;
        b=VH7SEaRvgXQTPtmsWY4r+Ll0e2+OEC2FDIyviR01wzrq42qjVRvGcMjGwp0uHRuDZw
         0sSETpg/Pt4Lznh/Ips97NDbt2D+PMdTtf766nQkqhKr/vaQrggJZkPEYDUrSl00EoSm
         8IV8p71f2EdQxd6ilDUI5HpIlSnZgpzyiFGUHZWOw0XAMAwuMVccW3IvPPnYA+RV0C//
         BJ+YU4oOdPk8T2jzgK3hgGjT8JwMCyo+3apwulYFeQXoD7HwVvQUXWHBzMLvfUSfbW95
         ZXFlVgHpLxEYhaUGwkhXcz7bvGFbWJbqoG2wylDSagUmafAWSTRYd4rH8J0GWbMj3CrQ
         ZoQw==
X-Forwarded-Encrypted: i=1; AL+hErH02HnNAHD/B3gq/jUsDJ6JNWQ022v0/JHWfpplymRkTBczhy4sNxKndGUN/+OeU2aKm1f6J5ujWew=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FzQWy2zZ+IoJ4cNZ41IUVU+GUQ8bBfDL53my/aZrqHPQm61P1
	HX367CewR5e5TA4/n9t1IHrdIpDenRgh81uDlK6CDzXGmunHcFEawc+K
X-Gm-Gg: AZFdTZe6Zr4mt5PoS/mNO0hOZvx47U8HYO0WzTHRljCxaen9LyUBn3dp7fK1wShtueA
	BANTwVzJi87N80BSEhgFTtk1BnUL+4dK5LHwg3WUmikCciIOzil/5F0IcZcnVxvnjwl/GpfTZhS
	UO5/mg6dP8g61BoMlKBgRzyiVeAqkt85bpeRs4UN/ns2Hjs/5mq9Y3w06H+59KVFMZEP7oWjx7e
	VShUkxnjIIW2OVeiSQAgULgCs5eX6LqeuEeTDUmQ97INKp4h1cFHHI0lKe5I6K2pKRGqInqY+I6
	dNt/PeZX5bEIKe8M8E4FwnKzIs1Hm9xtthfKfrAFIN+Yi8R3u13pSZohbjLQicUEDMKlZDM/6FX
	amh3wv9x/efG1EzhKVMZS2xN3MaM07H3QdsxtVHJsoF9o0ZwGr/9atQVVm8JVmZTmPEij52oFIx
	Tr59ITg23EYTLDDRadnBHsuxbuJamgFSwZcr6YZ3wOcpMUqxw9+LLP75kncnk+VJ8wRhM6FESBB
	/816IAat08T+BR5wjf37+YC6wMr/+Sm+erJzUE9EZKUQ3np+EDrxOlzTuLNwUlT/BMoXEYV7wsw
	rCMdfiIbvgnNvaMAyODVAyAUMIBGFFpykZK1XCF+t71ZQfM=
X-Received: by 2002:a05:6122:3b8c:b0:5ea:f220:fd6e with SMTP id 71dfb90a1353d-5ee8aeefceamr14730581e0c.11.1795797101340;
        Fri, 27 Nov 2026 08:31:41 -0800 (PST)
Received: from ehlo.thunderbird.net ([2804:388:90c1:771c:18eb:ef7b:e7f8:aab3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99eab8e7b9esm10043528241.3.2026.11.27.08.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 08:31:40 -0800 (PST)
Date: Fri, 27 Nov 2026 13:31:35 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: linux-perf-users@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Sizhe Liu <liusizhe5@huawei.com>
CC: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 corbet@lwn.net, skhan@linuxfoundation.org, bhelgaas@google.com,
 yangyccccc@gmail.com, jic23@kernel.org, john.g.garry@oracle.com,
 will@kernel.org, james.clark@linaro.org, mike.leach@arm.com,
 leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, wangyushan12@huawei.com, wuzongyu1@huawei.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linuxarm@huawei.com, prime.zeng@hisilicon.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/8=5D_Enhance_TLP_packet_deco?=
 =?US-ASCII?Q?der_with_field-level_parsing_and_versioning?=
User-Agent: Thunderbird for Android
In-Reply-To: <b1733f2a-ed03-4f38-8c40-6e0e535f1632@arm.com>
References: <20260908140509.2485649-1-liusizhe5@huawei.com> <aqB37YCMUYKodo3N@x2> <b1733f2a-ed03-4f38-8c40-6e0e535f1632@arm.com>
Message-ID: <D6C7F85D-0A2C-4569-98FD-ADB616FA106E@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 27, 2026 12:12:14 PM GMT-03:00, Suzuki K Poulose <suzuki=2Epou=
lose@arm=2Ecom> wrote:
>Hi Arnaldo,
>
>On 08/09/2026 22:02, Arnaldo Carvalho de Melo wrote:
>> On Tue, Sep 08, 2026 at 10:05:01PM +0800, Sizhe Liu wrote:
>>> The original hisi-ptt-decoder only prints raw hex values with generic =
field
>>> names for DW0/DW1/DW2/DW3, without classifying TLP types or decoding
>>> DW0/DW1/DW2/DW3 fields according to the hardware-defined packet format=
=2E
>>>=20
>>> This series enhances the HiSilicon PTT (PCIe Trace and Tuning) packet
>>> decoder in perf tool to provide detailed field-level parsing of TLP he=
aders
>>> based on message type, and adds a versioning mechanism for backward
>>> compatibility both in hisi_ptt driver and perf tool=2E
>>=20
>> Series is sashiko clean by now, has a Reviewed-by, but it touches both
>> kernel and tools, I wouldn't have a problem if it was processed by
>> whoever maintains the kernel part=2E
>>=20
>> - Arnaldo
>
>Please could you add your Ack on the series, so that I can pick it via
>Coresight tree=2E

Acked-by: Arnaldo Carvalho de Melo <acme@redhat=2Ecom>

But you could have taken my "I don't have a problem if this gets processed=
" by somebody else as an Acked-by me, documentation says so=2E

- Arnaldo 
