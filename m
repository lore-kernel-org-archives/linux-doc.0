Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121953;
	b=jFngnBj9LJ0hSYR2bjURKyKGUHLlMlWv9WA4m/stqNdT+acK9ga0HRoxOJZUxR/r0xHO
	 9OE8n3dS6OLeHWXPM0/fmWDA+/F/MCReRRUjzcxQqYrFvVoM+kbuitTYkijKx8P/966lj
	 ZTHlddJxXPF1JAEW2yEC/0nkg+qUY8oBDrE7twFClYVHqB0HDWqMTQ7OLeCQcnvmiP12J
	 ksNIfsFLyXiZKraCR10Mdy7G7xw68AjeJsOZuCpaS1W5vZm4JofDMVepMyorNQfU8g0s9
	 0sJJBRAOD3iJY3Ctrw5S00e7k9b5sw9i8I5MSNp4N5utZif4mAKZr167dScHE+HWeQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QaX11FKlbrrxel5yt5lItqhWglhL95q0Q/UWvFGwSEM=;
	b=uoL4ayG2jWPlu4Bqtmd2pYo8EyyjzyHUpP1r5xQd5pqmjDF6bIs0H8FOBWEpJ7D21fFl
	 X5utv1YstnYyCje3XpnclcYIx8BfiC+5egG+kdKIQcgEOj87gUxP+UISsB7WAIyi/1Y5Z
	 4USyYkBvdzCer0aFxE8RZOkduNG9NDWFpbkpfXD1NUPElP+lAX+MFkHGbc8xnJi2cZL6y
	 jZ9/gLMfmHnFISGnrrXH5jEX6IKaUW37wouHsGJCfXdx1G2mGh+sB+elOdosEv9P0vkjw
	 /GTVui0tO3eLj4O0ng0gzdxXa+7sk3kDiTl78Uqm9WaQIILpgLuU8uv24sMvtrIz/Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhNZ3HwP;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76A2606A322
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 07:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C76A2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhNZ3HwP
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4922dbcee23so108689f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 23:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794121951; x=1794726751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaX11FKlbrrxel5yt5lItqhWglhL95q0Q/UWvFGwSEM=;
        b=UhNZ3HwPUWb+xsU+LrB9nBdbR1CFNHYoIhf8bYXVRaVpgKnz85xHpaEmfk/PNrPQz2
         mkMtHK2+IOess921ezEeH1kaRuBfb1gRfzVjCmdCWR9LH7w2KHZGG68DeZhrcceB2OU1
         nLjzBlJ96rhGWGjufIbJWTcZUd36JkJIaSs/tRDfWq1Spntglf+D+fYA+1Bt1w+Ques8
         VW75Ng9OJxgQQ7+E7v/TaEC3oUbpdnkI0pKBR5Swp4G9Q6ql8S3Gwo+ouc8SlzXxCVki
         17aStwfzlHx+IEg63Da0M4w1/j//VSshjYL7I284x4JTIumEQokRrMouIruXdmvbSUOH
         jtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794121951; x=1794726751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaX11FKlbrrxel5yt5lItqhWglhL95q0Q/UWvFGwSEM=;
        b=2TSrzUCIAmczXx1dIoRa56qjJ+FyTwwiaHCujviGP5NUkVZo61JrKJQHarzJmfzzIB
         q+Dq/Mnb0O4T/jVxFQasya8+nZ9ASuWbRKkymh+zZxTxNbr+AGY1Cf34ACVG8EYH9mar
         lxyI+O95QFPLbQIGdYMs0DKGJYZkfgDEhVWXTt5AL76ISHeSW068+VemuC7dl4CgPtWR
         CPorOjZPNl5x/v/CfnlT2hFeuGAf1NPJQX4HuoTIWpwIbPLFENkxYHBkxkwsQTGgylFB
         M+6nJ0j0poxQyKrPixQ5nNeDzgakDaHqb1eIP5MbHvhkBqlPOZN8ElEAF4+/9tZiTSMo
         MwAw==
X-Forwarded-Encrypted: i=1; AL+hErEijVwvRGiAgGFyD+hsZ27v0LCZ8s1Sz0iLxS6ErON8hLzvGF1rsaKKoEAWvyXVaRJiBiIcNzwK7EM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TJSpnkYnUM6XDTLHMsPbmMXZi12vTUGsag4+Xx4VGp59UDRIr
	y1M0XMgo7E26b+tsgAy+tSbad2f3yrYOqocqUnTV/k6sWuM3XXX2O+N7
X-Gm-Gg: AYBFou3FXBW1pQI9RFVjRpS8f13hsooUZ+o7JJEDVgIynK4BARKQAYG//OR7G3Jerod
	tcRgIQPnoEXqTlMCv6pv5qY/KT3+tMThUrKt4Dov2n3Qs/Q6UgNB3ThbuCgnOp8HLsH3nJUc/SS
	qypt351UNyExnlltNAzeKbuW2Q8qOWfwcCpVCZ6MkgzZurBKnkkak+vecviGunMWv4Mb+k9u3UK
	NGHCaAVLjMHdGjkGSczUB8KXp1dD0po0xaBB1yZLte+TtLiZqrTUnXmyocg5Ezxgs3+Ixnm7Oe+
	/8VirC+4BdnPLDFeWWhZSmD8bWqL5w3T5Jqzing7umBj9A3XYHNIJZTvg3HtynqpD6/TE56i3wB
	vAc2N6la7cKvSdm9hHYF0zKpf9gZk+iMTjRRkp8o967ZXT88f4TUbiS4Jyn9+wdl0V6E6KrV0Uo
	6xtoSVpxsMLkYF3Uop07loqH5whM/oqNUppetYys2CJISwYDtuMADnKdqxFZueq1S1Xy1HfQvBU
	D7KFuItlf+gI+yohcCji175Bf72BS5CyOac2VfkXd5IurL+bxNgwakV55omkkCw5b0Xks2uFSw7
	9LukVLbJf5NBUKWraArx8CgBA0xnuf1qeO2vDoFAEEc0nuYkQNS8cwvVMz0D2J3TqwdGzWA/zVQ
	E1hlpSVFgzpeHhZ7kNg==
X-Received: by 2002:adf:e193:0:b0:491:e28b:1e1e with SMTP id ffacd0b85a97d-4958335a7efmr1603970f8f.28.1794121950867;
        Sat, 07 Nov 2026 23:12:30 -0800 (PST)
Received: from localhost.localdomain (bba-217-164-30-115.alshamil.net.ae. [217.164.30.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495b90701c7sm2609204f8f.10.2026.11.07.23.12.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 23:12:30 -0800 (PST)
From: Ximing Zhang <xzhangjr@gmail.com>
To: Hugo Sales <hugo@hsal.es>
Cc: Ximing Zhang <xzhangjr@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Len Brown <lenb@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Ashton A." <me@ashtonantila.com>,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] cpufreq: intel_pstate: Send CPUFREQ_UPDATE_CPUINFO on max_freq changes
Date: Sun,  8 Nov 2026 11:12:25 +0400
Message-ID: <20261108071225.54656-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101185807.112449-3-hugo@hsal.es>
References: <20261101185807.112449-1-hugo@hsal.es> <20261101185807.112449-3-hugo@hsal.es>
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

Hi Hugo,

I tested the four patches unchanged on an Intel Core i7-10510U using
intel_pstate in active/HWP mode, on the stated base commit
5854d2ce4b0b9ccb37b154319d8283bad889a694.

Cooling states 0 through 3 followed Turbo changes in both directions.
I also ran 100 CPU 7 offline/online cycles concurrently with Turbo and
cooling-state writes, followed by the same sequential checks, and a
suspend/resume via rtcwake -m mem -s 15. Turbo was disabled before suspend
and enabled afterward. Those checks passed with lockdep enabled and no
new warnings. The test kernel was already tainted by unsigned modules;
that taint did not change during the tests.

There is one remaining Intel hotplug case: changing Turbo while CPU 7
is offline leaves that policy's cpuinfo.max_freq stale when it returns.
I reproduced the same stale CPU information on the stock
7.2.5-1-cachyos kernel, so this behavior predates the RFC.

On the patched kernel, starting with all CPUs online, Turbo enabled and
cooling state 0, I ran the following as root:

    cpu=/sys/devices/system/cpu
    cdev=/sys/class/thermal/cooling_device0
    echo 1 > $cpu/intel_pstate/no_turbo
    echo 1 > $cdev/cur_state
    echo 0 > $cpu/cpu7/online
    echo 0 > $cpu/intel_pstate/no_turbo
    echo 1 > $cpu/cpu7/online
    cat $cpu/cpufreq/policy7/cpuinfo_max_freq
    cat $cpu/cpufreq/policy7/scaling_max_freq

These report 1800000 and 1440000 kHz. The policies for the other CPUs
report 4900000 and 3920000 kHz. With the Turbo transition reversed,
CPU 7 returns with a cpuinfo maximum of 4900000 instead of 1800000,
and an effective cap of 1800000 instead of 1440000 kHz.

I restored the starting state with all CPUs online:

    echo 1 > $cpu/intel_pstate/no_turbo
    echo 0 > $cpu/intel_pstate/no_turbo
    echo 0 > $cdev/cur_state

intel_pstate_update_max_freq() uses cpufreq_cpu_get(), whose raw lookup
rejects an offline CPU. The reused policy then takes
intel_pstate_cpu_online(), which does not refresh cpuinfo.max_freq.
This appears to prevent the new notification from covering that case.

Is this case intended to be covered by this series, or would a separate
intel_pstate follow-up be more appropriate?

Thanks,
Ximing
