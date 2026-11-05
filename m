Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869069;
	b=R5cKCjNYRyuwa/fuiq+gRXzrXFliEnpybyFrw5G9hbPcfPOJ5lEySEp8wruhkAvQJ1Oe
	 MyQT+HQTFMeMDwaKGn1+v1ks0CnupL0lXCZG0ZuIVEmIJHu8ke9RCvFnq2XT9l3Q5FxmL
	 vjdXHG/hfT4F8uG6trVrP/GwXiA79+uJig3HDI5bMOXFBpiME1bKlAXgpNF0Ts7ktKTTC
	 HdiBzrwuRlpxyNcQNw99oJoNzwI3uYQ5Tyzm5acyV8h+C/oM/G+GK7WUBs8oX1tqs4HSc
	 vKeVRtWpgZ7uZphdhiy9pOg0W0AF41JIA8pHbmdQ/rMJ0CMPvnqR3xdiTp0YPnyWRiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869069;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0J35juf+Q3wPkqJ/fEvR/SIaQikfoEpWGs87Fk8Zd4I=;
	b=nmf3XUUYnVLz9HjhT+ir5NJRudHgEkwO0m0t0pr0EFit0yxKzzoM7o5VIXiA8x0KR9IB
	 9Y46K3Qi1b+bwAq1632By4FfK0/RcuVwG4D2Vx4UFsejy26tQW29dDpWRnTNpCDiFaL91
	 FxqqvJyCgEX1RfEfxwyfUABtzKMaguEb1N8AgQuefBNAVt/pymnZw+jto+qhNGinDBe88
	 pRy2ARIHuAPThlfIedCuYTEy2KY4uHgebWlxl0rxUdongqgbc4uaH+7SgWdz8POnHUm9y
	 fRJ+huCpbWcTTxbuq+1JbaGtMcB4zL60VUgQN0GSeaSBwx17rWOtRQkYboxfFRj4X1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=95.215.58.116
Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801A606A326
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 08:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C801A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cl508koB5a8RnOsym5lLE/Q8Iyz8NnCi/Q9gPQjRJbE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793869060; v=1; x=1794473860;
 b=jHpwiRQzQDFrOwTh+1KvLJo3LtHjwUXyPRM5LDgEyz9K7ZMRv5kUImDPOniaaXr5uRBxkFlm
 IxBeyzJbzZRVu9ymLOLqqfe7N58LvcDV7+VL5wVuXt+y3m+jQDVUdqq/d1DIgTf5fFH9mEOuJVf
 /LltGVInpNfNijQLiScRYwbGhWCogMcZEnBmUan20DUxkz4pLoE9nLpf8Jmz92WtAolaQsyBRGu
 KpcCi+l7xVCFA8M84SAA5e/zRlHYxgXKLQ1driTBsNrMkWMIQmDf2OSah0TMMX8XiJLvC5A65ko
 8S4MzQMhIFfRujCOnJmOffofQbycv9frS548t/BUeBhuA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c9cd18ad5c886574;
	Thu, 05 Nov 2026 08:57:40 +0000
X-Mizu-Trace-ID: c9cd18ad5c886574
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 16:57:33 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Clarify half-baked review tags
Message-ID: <auxE_RJJKYf0gPlE@wyuan.org>
References: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auw_egkhHADKXL90@wyuan.org>
 <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> On 05/11/2026 09:34, Weijie Yuan wrote:
> > Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
> > 
> >> Refactoring of driver subsystems or some core driver parts often come
> >> with change of the actual drivers.  If that happens within one patch,
> >> people giving "Reviewed-by" tag only to piece of the patch, like one
> >> driver, and ignoring entire rest including the main concept of the
> >> patch, are not really reviewing "the patch".
> >>
> >> As explained in Submitting Patches document, the "Reviewer's statement
> >> of oversight" is for patch:
> >>
> >>   (a) I have carried out a technical review of this patch to
> >>       evaluate its appropriateness and readiness for inclusion into
> >>       the mainline kernel.
> >>
> >> The sentence is complete, meaning it does not allow implicit variations
> >> "this patch or part of this patch".
> > 
> > Agreed.
> > 
> >> Reviewing pieces of patch while ignoring the main part of it, is
> >> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> >> not be applicable.
> > 
> > But in this case, I suspect that your "Acked-by" trailer will still be
> > interpreted as an ack of the entire patch in future git logs, rather
> > than a partial ack and/or a partial review.
> > 
> 
> Which would be fine, Acked-by has that meaning and no one really counts
> Acks or tracks Acks for any metrics or patch quality purposes.

;-) Also makes sense.

(I just posted my last one and found that v2 was also posted, what a
coincidence.)

Thanks!
