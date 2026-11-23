Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413622;
	b=Yjk0do+/cEASSukRKCzfja3z7c5+ZY6eXhZIVt7HNPTPotvAEhyglVGTlgvT4WDF8v/2
	 ssjqYr94QFnTMpaotF18yRiKRQovReSfSKDtXj17iAPNimXb/zPND73HP7jnOW5lX6gdJ
	 CXQjTPOXWvBnndVTaSiGrqZtQ3UhzZTkVFv3aG3+tlV09Nu8WhUo35r1OT8xAYanW1x+Y
	 SFv+O/9HGe2byLuRx+/G+rYTfFTwOjddXJx4zKHNZapShtZm+ODsgYxfOyPpxcIFOSffK
	 Xd26AdCrEtgJlTuO0WTMfyiaQL/aDao4vjxXExhfC60ez9PCzMDWucTD6kfsrhbt0BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413622;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=L770CXVvTjB5A0tDZZe6T3TL8JuFNIVsQbYdgnzmlIk=;
	b=gKDEZa0TW6TbOj+XDiGqR55Cjk32jJ/i8ywf8gtOjEFA7zl+W40tKO0Vr2h/3cHrOr+g
	 yF/uk4+QPENrYKGOGvFs/H6MVVfAkPdTATk8fIO7cI/WNpFTCWtejFO6w7tIyDtaOWzLt
	 Nmw5OM1pgPH1t0d2f3UT5UQTf5s0fqFKJXvfVR48pWDQupd9FyvS4XtjOA9zKKN+UpB+q
	 egt5WLWMQYWObpJGFlKvneQYJ3npXZb2HcTuiqt25ou/UBwpjtWHAsJkSHzATmoW9d2u1
	 fvZZsOZLjKEu6fivIsyDk5prryFMRaYc3BQFTlQSWyav9ttA3B6eQzp+QF6TXlMM53A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=L8rVqdeS;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68CE606A31E;
	Mon, 23 Nov 2026 06:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D68CE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=L8rVqdeS
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CBEAF40904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795413620; bh=L770CXVvTjB5A0tDZZe6T3TL8JuFNIVsQbYdgnzmlIk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L8rVqdeSD3wFIgJ2/jhmjNxmy+FAh/5/rYXnryZ060mCxwf8QLdH+aVkoy4Fu5RvR
	 K6aj9o9HZ+MApGIVSKGEqpeXgxJMiPmhUAJT2LFnscRKuJt+zg025QuBjqMN1HS/mo
	 OoG3lNK+idMYspP6XfdqEo2X9/Mb5V9gh6hH3kqICHaAh925UycIHrQ6UDIF19a0Ey
	 vKs7aLmyQNSiCyWJZZrCeb5BCbCL4aVtMKGt/WynEEs4KUeypHLAw6OaoCFqferZMW
	 VkaLUMIpqDWbxE3//0HeICpR+W6RKKFl3WyYh8DE2OIjYgk9f8MT/o7bmNRw9z7X9i
	 fiJt3MaY1a2IA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CBEAF40904;
	Mon, 23 Nov 2026 06:00:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>, mchehab@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: kdoc: print each warning once, and only for
 selected symbols
In-Reply-To: <CANYW1HwYge3KexMovtx8UiU_RBqv9VDqO==TLVLD5zD9i57Ypw@mail.gmail.com>
References: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
 <CANYW1HwYge3KexMovtx8UiU_RBqv9VDqO==TLVLD5zD9i57Ypw@mail.gmail.com>
Date: Sun, 22 Nov 2026 23:00:16 -0700
Message-ID: <87qzgcytn3.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com> writes:

> Hi Jon, Mauro,
>
> Gentle ping on this series. Randy has tested it and gave a Tested-by
> on patch 2/2. Please let me know if you would like any changes.

Patience.  I have other things going on right now.

jon
