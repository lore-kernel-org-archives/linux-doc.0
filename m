Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BEB422E2A
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122925; cv=none; b=cJTqxc4wA9VnPWFIR/23JhH/xv9vnRps2Sn+Bb0C0rxKU37CnYmhdFKRiX5YmmvltATNpZGjVDHOt2Z7/FAJD6AKQZY74TxBjzTEXxAz5udnBixy7O4Z/FdHTuTiREDIAz7BkZWO/14iT85Gbg2F+pQvegzF/9dtHOlW8YnIVPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122925; c=relaxed/simple;
	bh=zynlzfsI6UwwodopzfzzUnIdemfXBhgywKabtrp2jXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eN+gdVjMmwclFn1MXc63YrN2dzIfBRw+8elizjxiHYFQ/f1mBO/f+p2ZDQUzY9U+30nHNVAadkBL00DL4GAYCX95+yOMkRWVl5fFV8PgroLRt7rcFyWmiS/qKhpPIsWjw1uCNfO1rUG8qea9Aut6ulERqEEQ4+JNcQolA8PQ0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jV2/Dn4G; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jV2/Dn4G"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so497243f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789122918; x=1789727718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zynlzfsI6UwwodopzfzzUnIdemfXBhgywKabtrp2jXI=;
        b=jV2/Dn4Gav/TFU6PQfgQkm6TgJUur+I1+tzLEKEzHygOoPGgDhwIN4dOzSNIoejmPd
         4Z2igqUKgoVEly/bFesNpaWauJ50EoOrSUef+d10o8Jvv3cQEtjiqv1EGO/DyE7y6Cc8
         PwX014jR85PAJGoQQ8qB0Zq+aD45fSBara2oQ5YpCYFQ4A/ACXhZcR51UDkSZ6Sqq49/
         yYfESF5fFT8bSvt/EsStNYnRjKarty/wjw7+v7OjylrhPiL2+XkWHmqznx/o5jsHD3Mz
         j6dzWV7Awpe45Sq1YxwnKl54b4Rt/AjNGn8WKU6NaZyUqp+cM0EJh90y2GBlYQP51Vda
         fbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122918; x=1789727718;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zynlzfsI6UwwodopzfzzUnIdemfXBhgywKabtrp2jXI=;
        b=ibrLTlZ+V5TPqhUVragPI3yeuFiK7BjpFh5UqWrSynN0vxag23fkVmvxcQ1GiYG7v/
         ZCYP7eSXpW641hlZ+KNoqIKQF+d9wG4WrdQayHsBUDAm91vCi1DjkrgsKvauLkNgoK9A
         c+euS3omGGHTfA236gP4dusTvB4SzmIXRxoyiK6JL6eNjHN2XjD6j7ZByDU6akYkTvC9
         F1M6PaahWjtqebR65NeMqzOo99qIazqm+ygg2tRTTg4Ppvrn++SR5UUV8WgRthK2TbC7
         /pYIK/3/9iJzMjNFa1o00wWhBwpkSeJA2xqgwvydDFkocZ9nVDAhQGcnDslHA8n8LLvT
         ke8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmqizMym1EhiBJw9AsCT+NPb3+fFXdfQmksYyLV4x9ogg3q/qCmpo2psFca7LAMbl5jeR1ge6Dq/w=@vger.kernel.org
X-Gm-Message-State: AFuF++mk64OjTEghGh24GJLDP9i1TFXzj2GaEMLGYX5WqcFNzOpGzPn9
	pizhBRXkWpPA34HVa3joITjs4PK9dZKfCjrITkIQaC95i2CraaucLlQX
X-Gm-Gg: AYBFou0ez7d+84ArBBRoH7g8batL33PiyNI8jlXLeFo7Y7CxXEsMmb9deCPa7KUhC7x
	wdCMVJO2I3umi2rcxMR31Jqt7i6pdivNBKpwI/A+b3DOuPQIKHrOaCA0yGGcibsOE958FNfgwk8
	sDGcuSyafN3JoQwnzBW1GPCvmXACIfSHsa6hZRIW4tRkXoRQzdGmMmEkQ0dqgKGprgB0U3F5Za4
	TIbhC/q80MS4vHHdmBJ3+D8fU63e1rYyJlNxO0rQW8gSFyrKgsXumRkjARcPTIVhFv5f+eYAEr0
	KQN4t2BTJAPw300KyycQSzZuoR82KRtHmLaoXxIMhL7Zw2YA6xcUDon0Wu6p3FFwjt8CWWKyZhe
	cWTYfby7y39kI+5xfKko0VtLKBOd2Kui4f2XcCEqx+2+Ep4ChwfVmWKFEEheMc4QJwFQ254bqmv
	g4eN7XYVaDl1U2QihaK05tszWEZt1IrK4ddsftdbu+18c8kRXe7Y5m1qNc8FFy/4onWy5wkoGEX
	ZwTZdiTNCkwb/OxPe4=
X-Received: by 2002:a05:6000:40e1:b0:485:8c17:9764 with SMTP id ffacd0b85a97d-486eb30bca7mr3554741f8f.38.1789122918156;
        Fri, 11 Sep 2026 03:35:18 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:26da:f468:9a65:f2ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5177613f8f.5.2026.09.11.03.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:35:17 -0700 (PDT)
From: Christian Melendez <chrismelnu@gmail.com>
To: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: b53.rst: is the 5325/5365 "no tagging support" section still accurate?
Date: Fri, 11 Sep 2026 12:35:10 +0200
Message-Id: <20260911103511.171722-1-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Álvaro,

Documentation/networking/dsa/b53.rst still lists 5325/5365 under
"Configuration without tagging support", saying they "support a
different tag format that is not supported yet". But
b53_get_tag_protocol() assigns them DSA_TAG_PROTO_BRCM_LEGACY_FCS,
which seems to have an implementation in net/dsa/tag_brcm.c
(brcm_leg_fcs_tag_xmit). This looks like it's been true since
c3cf059a4d41.

Separately, ds->untag_bridge_pvid (b53_common.c) is only set when
tag_protocol == DSA_TAG_PROTO_NONE -- which I guess no longer applies
to 5325/5365 -- so the VLAN workaround described right after
(removing the default VLAN 1) may not apply to them either anymore.

Is the doc just stale on both counts, or is there a reason 5325/5365
still belong in that section in practice? I don't have this hardware
to test against. Happy to send a fix once I know which parts still
hold.

Thanks,
Christian
