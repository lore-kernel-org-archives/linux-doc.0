Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073032;
	b=kgg6LSZVkcy+0JsaAtjkWAr9LDvHFUHkXU3wydP5l43zeCnduijYHJYizAYG926bQqYD
	 W9f4u7RAUmg6/uRRvRU8JLpH9kfhiSU5/uV7HTLrlAAV5/SHxr79S/sfliIU51HKIMgNb
	 wREfIY74B78/yxGTLKuWkCLEysGaj0ACBWMVbSU0wTGKE2McRRQSBT6I/uDdV+mAK6uI0
	 zTMbWGYQJnwPAC7Qbg8y1CLenG3+q/BWKEZlOpncjnTe/dVZthLuXu4gu784LJxiz6MQM
	 mg1AgbOdHivqPWbwWEIP2PgnPY+N2TRqbu86kqliN05Jia5jQ4s1NkJwlf11VlKwIfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073032;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=VSAmRtT3yrbZt4K/fQTfT/uU1ARzqEc92zTiDgmMl0c=;
	b=QJNqd1AXdxkw4bTPNyJLXQLe5B4rAXuiHKflkaXlyMHPjRBs8Yn/MpOhD/97xP1TQ25U
	 5ajFa0t32ISHONU7KURwZQ2VzcMDiBq4AV7LCeySJ73YESZ+dvuvLkhqqetCPjCr76Qjg
	 K2zwWUVQcBnNC/ylrWklAIeHrxAFV4WcMW1PN+a46UyTCdDv2wNTplucJcCIRsDrTlZra
	 j4s+vBoWGLABVNlDy0YKbgMSq5yi5YFYX/SohmKJy2GtyXoZR4lxAAKVlmSZE78EdHoaq
	 vaccwQg9dhbnlma2Cx54kEP1TTGbhccey61aS055Qx683ehlQQDKfFbLXXRin3Ky7hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=YbBjV3Sn;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFBD606A320;
	Thu, 19 Nov 2026 07:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACFBD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=YbBjV3Sn
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jVVM20zstzKvdh;
	Thu, 19 Nov 2026 08:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795073022; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSAmRtT3yrbZt4K/fQTfT/uU1ARzqEc92zTiDgmMl0c=;
	b=YbBjV3SnXKx2Z18omeStciXg/459vJzsvqWJ1CDMGV3JDAKXh0F19kVxSk0ZGdT3rFBc4Z
	U1h2UOEc7jYkahiwv/S9ALly4cJI8jIncZzJwthwvFSHPSFfad5PBrNaRAxTxxV7xykx7P
	Putw2IPMmR7LpJwvDKLOZmET7Wsl3uJhnQHIEbU4QRTJ5d15LxiMH733+iOCWCnw/FLyrU
	++KaeuJZejI2B8VoCAU5tAfIwN4Hkx2xS2fcblec21friEOSGEnXhSno8TVP6SBtOVdd1h
	7S1inbLw5u3wBWJdIlNik1WW80VqYh1vZ81w4ayWWPJfggHP9b7j5xod7x0HqA==
Message-ID: <48d9790a8f1d2ca7281907f1c32d7e7759e9eb77.camel@mailbox.org>
Subject: Re: [PATCH v5 1/2] drm/sched: Add drm_sched_entity_get_runtime()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, phasta@kernel.org, 
 Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Oded Gabbay <ogabbay@kernel.org>,  Danilo Krummrich	 <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, 	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Heiko Stuebner <heiko@sntech.de>,
  Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 08:23:39 +0100
In-Reply-To: <1b78ef4b-011e-4174-800e-425c94fddf3a@igalia.com>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
	 <20261112171144.3151554-2-sidong.yang@furiosa.ai>
	 <34494226eb920bdbd7f3257ef6f9b20f4e8ffd6a.camel@mailbox.org>
	 <1b78ef4b-011e-4174-800e-425c94fddf3a@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 9257ce8575c14bb1251
X-MBO-RS-META: ir8144qoixqtt1apjywihsqo3j4z79ua

On Wed, 2026-11-18 at 14:39 -0300, Ma=C3=ADra Canal wrote:
> Maybe we could name it drm_sched_entity_get_runtime_ns()?

Both fine by me. All no big deal.

Acked-by: Philipp Stanner <phasta@kernel.org>

Please merge how you see fit.


P.
