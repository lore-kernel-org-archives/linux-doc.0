Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667941;
	b=OSobO8x4PtY7rwVfdHW/P9LRBcTiCDVO++6uUHRFQ8DjMenozhJbn+989XgQG/aeQs3r
	 +vvrKs/Sl23B19uDX/3juSoDqZWWtiQnxaECE8h25lhINhOMQNUgpOFaqe8PbBQDmfMOR
	 VRLVle9hiK3BXRPUOpDaw2wqyoyRYtJCIrG27IKt75v8ST70krjDm4VLCQK8fWfCDZhse
	 OYCP557KG9aZMoamwWa91tFZ09ZYzuzU/exoGn8DybHP00R8APTf0Iz25zSyHvF+AenJ2
	 k0s8nbolULskPstZqiprR5v9dqHaseAuLHVL9yz/AiJXueolfwNqsdvK2wN/3JAe8wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
	b=VhgscRkxLf0ZIlfdMm0JS1NRAVfNzMPGKWfFov77vJtgceQ4TQEqZYAu1i7JnTTI6RhW
	 x4enqRIIKPFfHk33BkZQDwHOYYAf0UZLFhdqOnPQ94/8vb3HOGK/5iYR/RI4Bw4yju5db
	 5HvKSXwCBUoi7kyh67ZycG7bw/9ciWhxnyPLCdrtJIGU4KLPTx1e9vUz0dx63t0dJsYA0
	 SIxu5gagI5TUjh8WcsrZJ0PqrUA1mJcG474VZN/VwiMlC1ulAN9SmW6hLtoPesBMl9RtC
	 hqWyKR7LJCq/e29K+tL8Nb70ZFf0vVuN7zbxinGO/LfpQyaJSMgafBf8qjC4Q6SjRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pUb0rNHx;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853DF606A327
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 01:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853DF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pUb0rNHx
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53653e30353so63242391cf.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 17:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793667939; x=1794272739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
        b=pUb0rNHxiAU+LF8DVe0ZniHMW9XjI2QNJZUDuVtuZyauhWJ9JcYl8XRJUwP1m23NN5
         YhOjwo0TjD9eLE6c+GNdgdirH4NqQys6UuF4s1ak2aBWg+qYGy0UdkpqSeNSUH+pazVY
         djyuyvx4EOAdRDVN8Xijkdq2CFi+TXuMFmjrHrjS/MOHZgGCyI+rcXQ0JE0PS/Vit8ih
         SIRs5HGehq5NrqF2hE9UIkltDBQeI+OydffKxerZZONTbpFg4+FAFMsEp59NIGXCq3aI
         XaSYJO67edsrOWUfFASBvHIFuWYkMwgs7x8IENEGhSDJcl0V26I7CvXK7rKdPcK8adU8
         26Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667939; x=1794272739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qv+EdtqMB+XL1xqO+2Rl4b1uStrdgvx9BftdNrlvlQs=;
        b=n6gMbv8BPfIa4lC1zEiRLIxk5+dJ5rQ9hlSzEOOhz2AE2juPB6CCE0z/ej1+SgWM8H
         /wERpmhNwObDFMZR6Cfla+Rqh/mOFiJVJPuxd8dMQcnEPERyVG9eUxKkVMfUzW51njxp
         5QNHBEla2wHKm09+oQvBEK0Z8O5w8waUoCW86GTv14w6lQ8B5s5bA34Y4r1az39YBWzh
         g3F7IyjQtP9DtL7F5QIi7PzzK3ylfAwAY0/tpvzCDdb9lmjojhoYtYbPQsL9UQnSlQBU
         bTFeE7rrvRtUbIqozPstSaZGkGI4BKjGjqa2gadXXD+V5r0lh64Fax4brI3PB00pXGKX
         hW+g==
X-Forwarded-Encrypted: i=1; AKwUvByLs0CFaFGTovMtuZ1zeYGXi/Uyvxq9QdHQ/+Gz01g+VRJYzlj4c7+18mOwgLluR/BVo0ro3F5wpbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++Di5/x4DhKxpycPaqXOqhqZKm+uZ3o/tG8blW6p7QRKccN3aa
	8BkhpQsYLtsoQx0f1Sszl1EQn/rXAY2LR4XZ/DCTPBb002z51BWAzNfWKqCA7U2AUgA=
X-Gm-Gg: AYBFou0po/87WYMfOOFC/NFNdfLkCnSWjpGWpDMH8v1aLabir/WhZS/skyLWBl8S1Y5
	gqna/SYAdImhqglVLy8aR04Xdp69g8rq0+Xiv1ddHgo+fZCTM1Z6jA6jZ2ZrYtjwquZ7b4r3uzN
	gnMhjfbPxfgQquGZZ+fyqxMZc2Rt6f96XRMTn6Psi2lo8s/6gIQEQ/FrvbyZpc7c5EnNCyL2Cp4
	gkmRsfziBYq/Bw1VY95V2deGXxCkU3+xUYsDrnHkISYiWoG6U1pcRS+UkjHaKeliu2jz+VF0+y/
	F8sIkkNywLZ04siarBThcQfYulvUn/GlsPc9bcmz1FVlvIeirJYAqSe2DvYtSlreJ9vD5kBzKGD
	TvEE9krAIQDAwfub705xa5Ar2QvGyLJmYCWn8k7FbHcltUrxIJzWtQb6E24cMsbIjVLvdOY692O
	2sjfTyHvH9EvVxw7jCbAln1XNsKpK7QXihrv7TU9cEhjc1cVPqsXaq2vOsmTGiObAYrH6xwd+Pq
	Bx9V7VVu+xoJJOHxv1Z/CgUIcNJg1y09RTsZlgXmhiiQeHIJe+R8nokO83OISJT9fVTTjUCp/I6
	6eaGwNs7EdgDdgoC3MplWJsUQaUk6HAyFwi7fgaP7dBipABUaKk1GOprbay5iZFDFAFPVpnEFDr
	l0j6uq9uabA==
X-Received: by 2002:a05:622a:4017:b0:536:64f4:45e with SMTP id d75a77b69052e-542b7525e13mr187886741cf.50.1793667939125;
        Mon, 02 Nov 2026 17:05:39 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb57669sm12221861cf.24.2026.11.02.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:05:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xO2y1-0000000BIml-2jCU;
	Mon, 02 Nov 2026 21:05:37 -0400
Date: Mon, 2 Nov 2026 21:05:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 11/20] ctlv: Prepare runtime introspection
Message-ID: <20261103010537.GI3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-12-jiri@resnulli.us>
 <179302367452.58760.11808905856343064399.b4-review@b4>
 <auRmMPfaFINUIchi@FV6GYCPJ69>
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
In-Reply-To: <auRmMPfaFINUIchi@FV6GYCPJ69>

On Fri, Oct 30, 2026 at 10:53:11AM +0100, Jiri Pirko wrote:
> >So.. how about could we drop the sets, use a direct description of the
> >layout and do something else for the ID numbering? Maybe the numbering
> >can be solved directly by only listing the names in:
> >
> >numbering:
> >  - device-get.reply
> >  - device-get.reply.caps
> >  - device-get.caps.evidence
> >  -[..]
> >
> >?
> 
> I'm still committed to implicit numbering. For "inline records" I
> resolved it by having it encoded as a tree with 4 levels:
> 
>  63         48 47 46 45        32 31  28 27  24 23  20 19  16 15               0
> +-------------+-----+------------+------+------+------+------+------------------+
> |   family    |kind |   index    |  L1  |  L2  |  L3  |  L4  |      field       |
> +-------------+-----+------------+------+------+------+------+------------------+
>               |<------------------ record ------------------>|

Fascinating idea. Sort of like an oid

I guarentee we will run out of bits someday :) I saw recently we ran
out of bits in RDMA :\ 3 bits seems like quite a small number..

Maybe increasing op to 128 bits?

Maybe family/kind/index/field spread over the first 64 and then the
Lx's over the second?

At the very least there should be an escape hatch so that if this
becomes too small there is a way to opt into some new layout and fix
it without breaking everything.

Jason
