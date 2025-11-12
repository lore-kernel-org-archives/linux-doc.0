Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307E8258CE5
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762929875; cv=none; b=bP0oDiOs01w0X7yCUcCvrMBUmneFAM8noj2qqAd2WdUPjTdJwngUjVUkewG91sBJU/QSLRrqWUHbt1+WIj/CfttOXVDMRZloeleJwyzwS2Fhs4IIwp/k4v/6WchksthPHlVuLGQYkVZ0F+ptCdTAqqwTcNQ5WgLF4NBcsDqw4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762929875; c=relaxed/simple;
	bh=IELEeu7LGoirbxe756K3GovBAPYIdZ64MpFG+M3zlV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgOy+2nwOUJn+gbcTD4tdQTf3kToWWCS1Jea+thQsLQ28tekIOQb4rfOFQX9oWYpfmLWUtPQ7D8rQ/XS0WkZOgiKDwYsCkV39tXiOl2k0FFDNZ2WIjtUbel69Y51anr0Btfocb2Sa3NVr3v+wR4uJbtfIRwaOKT2F6+mphDTBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4O6yMtj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4O6yMtj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2984dfae0acso6103775ad.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 22:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762929873; x=1763534673; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ufAY6cOfQn0j0cNFuxbnlo7w/oe8vZbBRcBh2SCbBhM=;
        b=U4O6yMtjgo5MxjWag+7IoeygO41qJ+nTyiwUG13RmEPxXoD6GQ3CxWDCF8XhnZEb7u
         VQx7pp16eCcj1mZczzoIEi1wVltQE6oDVPj8QbOTz1wxXCU/4qlgGnk+EF6mj3shfvA0
         PQR9BW0wbGVk+IQ2zOucjpiicn4HFvxJnxG7AlgVrdCBuZc8tKgo9cMbtIy9u2PX93II
         ybKsw2kRCR0VtO9fynUAiFni6XqQ4Xkua6MXkVpKN8O9rb5AcYBqF4zfrmSgWOoOKLfA
         0akYHOau+dASNZIGra9/CfvLoYJCbaRjhrqBD0FQprP0CAtZjPo1DnY0wDLWIKUgNYkI
         3sAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762929873; x=1763534673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufAY6cOfQn0j0cNFuxbnlo7w/oe8vZbBRcBh2SCbBhM=;
        b=Qa9vY9NdbwJIp1zIPQp1rGVdSa2ONimg4s8jcGwPU+go4ZIhQdX3T+Nt8JfCYp1S3k
         X3iV81AKAw/dN/kAQIccb7r2YW+2oThgguc5AJHyzuvBlhJTPhEIWdm+Zr/6Gp3tQN62
         efANw15Vq3yBG2zHVFuC9cqViHwSks+f+YUTRtouV+V82ZU9eto1yWFdc42AAqm6+6zb
         XE4qlDORY/fux/Ia1hB/i/wXVEk96uSKJ4VhLrhCfi8kE5R9qF/9rKJmT3h7EyVy/iJn
         LdZFu3SYcakNMuo0NU1D4fZux3UMfTvzWAnli37pDA5LkhxdhGMy7U/oO2jEov9ZQLOf
         Fh3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9xAuH44w+SfliZO+YptN50Uv2LQTiosaJhrr/wRa1rYbcPexYE+RpgjqXo+iGQ7q6CFg7Hk0q4IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YymD7pK7IHfkP3gitqsoajg8vRxWKk1G3uZHT9mCw4MI+/RXE7D
	Kk762Cq58vsfoljEqni1Fy0snlz11oQFuXNtE743CIH+qoGqcv0NqgJX
X-Gm-Gg: ASbGncsFwgCHyB1tRHT6wn1cio+o3X8enrKr26IYCzMpnQo76lgxRaTmXcOvFYBExyt
	Sa3UOw5y8Ea/wLgn4UPFHXJ8xHfp/Du4HXA5fBuJrIviIeTjCMJVvpxZXnwB5xRleu3GycE/+ul
	4cN6mJhsjoZ7Lst/mWD70awdydBslL3xZCn0412fsB4tGH80G4P4cNGaMu5ofaYqf+4fgP6L5OB
	xUpMX7iTJMgyUYVbsaEk1oOjvnqVn6c0TXlPuADGYIAAraiBu95+tEC17b0DxLOFrbW/JaLU+gJ
	Caqu5a8NkisrHJ+sZdLjAviX/R1Y7A62PcY8yelGmc4t2jrvskIafIFNIUJ8Tbz3Z7cmU4NLPtF
	ENu3FmHnn3rB/nMsn7rZUK1WNGXYsfFYdpGfK/DhmpJsM0dzsGte2YyHzgBFgFfDP8ew9WmrBAL
	GMx/xg
X-Google-Smtp-Source: AGHT+IFBuLspXHV5fNvoRqtTudPFOnal2usY6QqHd62gBNO7qk1b8WNXavFrAnWC1zWUguQs22yurQ==
X-Received: by 2002:a17:902:edcd:b0:298:450d:6926 with SMTP id d9443c01a7336-2984edcaeb6mr19331065ad.34.1762929873528;
        Tue, 11 Nov 2025 22:44:33 -0800 (PST)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dc9fed7sm18444795ad.68.2025.11.11.22.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 22:44:32 -0800 (PST)
Date: Wed, 12 Nov 2025 06:44:23 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: David Wilder <wilder@us.ibm.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	jv@jvosburgh.net, pradeep@us.ibm.com, i.maximets@ovn.org,
	amorenoz@redhat.com, haliu@redhat.com, stephen@networkplumber.org,
	horms@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
	edumazet@google.com, razor@blackwall.org, shuah@kernel.org,
	corbet@lwn.net, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v14 0/7] bonding: Extend arp_ip_target format to
 allow for a list of vlan tags.
Message-ID: <aRQsxwgtra6L5cQz@fedora>
References: <20251022182721.2567561-1-wilder@us.ibm.com>
 <20251022175033.7daec7f6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022175033.7daec7f6@kernel.org>

On Wed, Oct 22, 2025 at 05:50:33PM -0700, Jakub Kicinski wrote:
> On Wed, 22 Oct 2025 11:25:27 -0700 David Wilder wrote:
> > The current implementation of the arp monitor builds a list of vlan-tags by
> > following the chain of net_devices above the bond. See bond_verify_device_path().
> > Unfortunately, with some configurations, this is not possible. One example is
> > when an ovs switch is configured above the bond.
> 
> Once again if anyone thinks this belongs in the kernel please speak up.
> Otherwise let this be the last posting.
> 
> *If* someone does speak up in support you will need to find a less ugly
> way to represent the attribute within Netlink. What you invent must work
> in YNL and be added to the spec (Documentation/netlink/specs/rt-link.yaml)

Hi David,

I haven’t tested it yet, but for the netlink part, instead of using a
randomly sized binary structure, maybe you could try using nested attributes.
For example:

IFLA_BOND_ARP_IP_TARGET (nested)
 ├── [0] = 192.168.1.1              old format (no VLAN)
 ├── [1] (nested)                   new format (with VLAN tags)
 │     ├── IFLA_BOND_ARP_TARGET_IP = 192.168.2.1
 │     └── IFLA_BOND_ARP_TARGET_VLANS (nested)
 │           ├── [0] = 10
 │           ├── [1] = 20
 │           └── [2] = 30
 ├── [2] (nested)                   new format (no VLAN tags: leave empty or use nla_put_empty_nest())
 │     └── IFLA_BOND_ARP_TARGET_IP = 192.168.3.1

When parsing the attributes, first check if the data is nested using:
nla_type(attr) & NLA_F_NESTED. If not, just copy the IPv4 addresses.

If it’s nested, handle the target IP and VLANs accordingly.
The downside is that this approach would introduce three levels of nesting,
which might not be ideal.

Thanks
Hangbin
