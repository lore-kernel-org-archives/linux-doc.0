Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE93388E75
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712845; cv=none; b=T2WyXSfRwZtAOjZAInFl9YX7z8yk2Sz6HIxDZ9nlXIPf51nH8aw6g1JB6YGpICjdjk2O4U3Gfe6UsOeP1SD2RoamLlrAAZAUI52TA6EQM8SDeJWQ6AOfCViA+X4qqiu6VSj7KG8nxg+SyzHtTB8e0EMwjXYn36JwsN+JU0AO8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712845; c=relaxed/simple;
	bh=aa6l7b+APFWz/5UdNV5Q7GOrbwD0gYuiQ9o7noutUhg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H/17AHA6fqpdTNuEW0ycguDPe9pg42dehT7JGqZAjv/lSjxXJFCtxQXisAID3hDAI9EJsVowD88yoAcgES8sDoTIV6/gRS0N2ATPimiZG+yZeAqZl7Ed2yJoZeZSbRnQHYr85xUsRmBdm7LLdQ79VPoakpkjNQHuYnrVvuQjzn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8Ybhon5; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8Ybhon5"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1329fc4bf77so5675526c88.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778712843; x=1779317643; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aa6l7b+APFWz/5UdNV5Q7GOrbwD0gYuiQ9o7noutUhg=;
        b=j8Ybhon50iNTQHN4Xu4aOCf5VI+NTxIWF/q7L8EbUVy3HOBjoLyTBJEqO88GVGMrS3
         JuXDV9Dc1YyN4h/dG/GOFXxxYSEAYT7joGGWrOzpuhlcKxm5kK6bdr6VqLwpEE+Z6eVd
         6iCk0xcITCCQjBi6xsSXVNOb6Ortr+b2kqPOWLyEDr/AMzvm5LRfQC7Gc3JzavEyJkrg
         iPg/JM9xkTc6y271uIZF1dlG9A6nV5Ph0vEhgwHE6LNNvY/dElEt4OS4W1VF/zb3A0LF
         oGhUIF+wUFbIcztygZYeaRUY5cWTYywDVSwiMyWifPtZNPZD16H+vegaaQIQG+ODeeBf
         QWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778712843; x=1779317643;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aa6l7b+APFWz/5UdNV5Q7GOrbwD0gYuiQ9o7noutUhg=;
        b=LoGvT6OrP145Fjb6CHQdcQjAGptDVIzgAVEI9E3EWvugLTo2DiYxx8BB1xkf3qOmB+
         ka4rbOICu+K+FJZIKA/QKCfVRG22llxSul2HKDMmndD1pTL4E0BvZ6CpcPZx73y+Edrv
         9R9wU1jcNgKZA8WyHoZ7adQKULghOeMdvSfZzFu1c1TSv20tHM1fsvE7nnFHli001ZOr
         B03qybjKQ5sq0JGh2TUgUKCGlpVqFKeYbAmXxEGcphgyUaUaDBIWmDeC0gPUWV1ONIFA
         m7iARH0XE2xOIv89g1cp8WzH/UBcQa9WeU6lElZj66jsSwifQVzl+IE69MVL7A1QPPDw
         s5Nw==
X-Forwarded-Encrypted: i=1; AFNElJ/SMYhVis5jCiUSpf3s9oTgY1mAI0Wb+MTVgqqaRqjk+TR8ZdcNo9FL5B3SbM63n9f/OzsgyN4pPE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3BjEPHwxRPMCa/mOHadOFBqLTCTGWeeuwwK7FrT3HirVrN5PJ
	QgWVUzjfgO5lI741K0mqg76JIqJIaEPtHEMuwzWNIuNfUtaIUowxNwee
X-Gm-Gg: Acq92OHMISRGXODLBhUZDwt6a3A/4CE/ExqdFLyUQAjmMWYIHDlANRruvgX30ydD9Sm
	mhDtdqYwKvsgi9y4u8iGHO8akOAHCgyDsvKX3wA2PRfnXWzw7i4hbkyJMBpXhjJZ2aTyIb1a7oS
	ZADN9bx0fjbDvzC6TZos5DX8Ax3e2Di//QO6zuYaTYAHLKVMVsMUHtUQyrjkI70YkqeBrRl7NEK
	BCCz+pZa7hdSez44EMl9Fuy6G0h+G+4xINFAXtMnYj95Zckx5L/rW919CYX0ar6rrx2CQCJCt7R
	qnCwmOYwQP7G6WPYbUUVxwMtXfFcVGAnAxdWPdfVLdE2PEVQ7QFuEr2tBYjgtSZmxGgBsa3dLVw
	3Ceeg0sG2N7egFKTFSFVS5jQVkp+uSoT2AXjqrZeTDutIRCY9R3KgpaosG5VknyOXLpg71H9sfj
	Po7KHu8UajecA73MVS0rUEw+dQZn/ZdLfW88dcbJtrkCX3h48thVLOfBNYZVrCRZviCI26+Ihgg
	Zde57Q=
X-Received: by 2002:a05:7022:6611:b0:12d:de3e:cc02 with SMTP id a92af1059eb24-13436bb037cmr3404126c88.41.1778712843089;
        Wed, 13 May 2026 15:54:03 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed531esm1473485c88.8.2026.05.13.15.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:54:02 -0700 (PDT)
Message-ID: <e141699dab70282d811ec30bbf2aa8279706817b.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 2/8] bpf: clear list node owner and
 unlink before drop
From: Eduard Zingerman <eddyz87@gmail.com>
To: bot+bpf-ci@kernel.org, kaitao.cheng@linux.dev, ast@kernel.org,
 corbet@lwn.net, 	martin.lau@linux.dev, daniel@iogearbox.net,
 andrii@kernel.org, song@kernel.org, 	yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, 	sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, skhan@linuxfoundation.org, memxor@gmail.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org, 	martin.lau@kernel.org, clm@meta.com,
 ihor.solodrai@linux.dev
Date: Wed, 13 May 2026 15:53:59 -0700
In-Reply-To: <da95f45b43d94d17796b19abc4c555e35daafab7d5e1cdca3714fe0f54ab8cce@mail.kernel.org>
References: <20260512055919.95716-3-kaitao.cheng@linux.dev>
	 <da95f45b43d94d17796b19abc4c555e35daafab7d5e1cdca3714fe0f54ab8cce@mail.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVHVlLCAyMDI2LTA1LTEyIGF0IDA2OjQxICswMDAwLCBib3QrYnBmLWNpQGtlcm5lbC5vcmcg
d3JvdGU6CgpbLi4uXQoKPiBXaGVuIGEgQlBGIHByb2dyYW0gaG9sZHMgYW4gb3duaW5nIG9yIHJl
ZmNvdW50LWFjcXVpcmVkIHJlZmVyZW5jZSB0bwo+IG9uZSBvZiB0aGVzZSBub2RlcyAobm9kZSBY
KSwgd2hpY2ggaXMgc3RydWN0dXJhbGx5IHN1cHBvcnRlZCBiZWNhdXNlCj4gX19icGZfb2JqX2Ry
b3BfaW1wbCgpIHVzZXMgcmVmY291bnRfZGVjX2FuZF90ZXN0KCkgYW5kIG9ubHkgZnJlZXMgYXQK
PiByZWZjb3VudCAwLCBhIGNvbmN1cnJlbnQgcHVzaCB0byBhIERJRkZFUkVOVCBicGZfbGlzdF9o
ZWFkIGJlY29tZXMgYQo+IGNvcnJ1cHRpb246Cj4gCj4gQ1BVIDAgKGJwZl9saXN0X2hlYWRfZnJl
ZSwgbG9jayByZWxlYXNlZCkgIENQVSAxIChCUEYgcHJvZywgcmVmY291bnQgWCkKPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAob3duZXIgb2YgWCA9PSBOVUxMLCBYIGxpbmtlZCBpbiBkcmFpbikKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnBmX2xpc3RfcHVzaF9iYWNrKG90aGVyLCBYKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19icGZfbGlzdF9hZGQ6IHNwaW5f
bG9jaygpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbXB4Y2hnKFgtPm93
bmVyLCBOVUxMLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoFBPSVNPTikgLT4gT0sKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGxpc3RfYWRkX3RhaWwoJlgtPmxpc3RfaGVhZCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvdGhlcl9oZWFkKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC0+IG92ZXJ3cml0ZXMgWC0+bmV4dCwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYLT5wcmV2LCBj
b3JydXB0cwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG90
aGVyX2hlYWQncyBjaGFpbgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGJlY2F1c2UgWCBpcyBzdGlsbAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHN0aXRjaGVkIGludG8gZHJhaW4KPiBwb3MgPSBkcmFpbi5uZXh0OyAg
ICAgIChtYXkgYmUgWCBvciBuZWlnaGJvciB1c2luZyBYJ3Mgc3RhbGUgbmV4dCkKPiBsaXN0X2Rl
bF9pbml0KHBvcyk7ICAgIHJlYWRzIFgtPm5leHQvcHJldiBub3cgcG9pbnRpbmcgaW50byBvdGhl
cl9oZWFkLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBj
b3JydXB0cyBvdGhlcl9oZWFkJ3MgbGlzdCBhbmQvb3IgZHJhaW4KCgpLYWl0YW8sIHRoaXMgc2Nl
bmFyaW8gc2VlbSBwbGF1c2libGUsIGNvdWxkIHlvdSBwbGVhc2UgY29tbWVudCBvbiBpdD8KClsu
Li5dCg==

