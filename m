Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD8C320A04
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885334; cv=none; b=RTT4UPUjd55cQAyStrT1f6K1sU0xMHDYDE60mL0tgELApOcRw3fxey7MYsBYPtQtlaXJYH4Cq3Ab3mX0mEQd6Zx2JClfRASWaQOxWMAgq+ykku+ujkOSMe2D/I/yWxjNBGljwjMf/8OLOFVS7rg0RF5FWWMv8yfQb7UO4iJ7PQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885334; c=relaxed/simple;
	bh=QWFzW8AiryxbX9bHsSDyy6FhwD+iu2OibSf5IcWI1Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eggl/cJoVTY5hE992rX6jpE0I2l45eV8My2IvEGvL175lZ+b4b7076AID7JylDzvJCoSw/p6lGSrprFtyH/Hne87u1FfvVOagvG/CdNoxqZnQIK0n+NAIMnQEErfzulGO5+3FjzY3CJaBpLDy1GUh55GHKl342HKaZobV8g8o/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5lKosHg; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5lKosHg"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7cdd651c884so1518048a34.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 07:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767885332; x=1768490132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcFV42Btb4Pg72+ADKdt3ZJAxf5GS4JhHeJgrxvwKog=;
        b=b5lKosHg7+ESgVswffeD5tWTkanPcq3h+ztzV6f/gXXm4nr6yyGM2b09SwLIZENljV
         NrcxpmR1Ev5aLcBPPP549QNjvWH+ocoWnC3eKnq3/Vo0C5oxpa1kbg8ODT55TM+c20BZ
         7ONWTknfNA7bkPfyhwpNnaOPHsKRzCNvOKA2gCt+K3NsmkA3elOWkOkNh7eUvlDBOC7p
         dX0eFSojRFSUXooJMp5DO+aA/6CdBzMHH0GGLpaYnNMFTFvQ8GUcW1oxicBHdzxsYrOD
         eui1PqmUFwlHvbhAgl3dlCBnive1VWuqBIifQT5oC+SpUnjVYTnnnJbVlkJ97Tariz/Q
         bYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885332; x=1768490132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vcFV42Btb4Pg72+ADKdt3ZJAxf5GS4JhHeJgrxvwKog=;
        b=lsuJMybcdf+ShWI+BZdqb8yM32SiazQT2mMe4MtfPPmz0puJOKHsz675rr3C9MEJEt
         d8a8YvOc+Z755sx++XHIgrlFvXg6o9TrL9Tih27j0/zte2wX69cdBjhMuCWT2FjrsJvE
         SJSjYM5SeVa84NmW80AZedL2Y4BXDFskqwXFBlmb6zaCcypW/buOoHX6lMsaXJxI7PqS
         D05UeuaJjkDvwpsBdc03ofKtNcZW84xnZvJEf+toNYx9yzYJeQ9M7z/8GjDjUKjGXBo3
         4GZ5NRplCSz/dlyIdDgfT+Ji8VED7ah68WUZEow/DZqYIazriHlLbnCQdYtCU7rJGjKK
         zT1g==
X-Forwarded-Encrypted: i=1; AJvYcCVbN0pVqpKzOQdC5cFl1V2IuC+1Jz24TJZdOdR2P2S4FlbLQ9Ipovnjv2/03mjcXpoCnNX5SnO5dSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YypzLlykqvbcwlNKp2WCfOLzFHC0BbTR0E/M1vL5YMmArZzJ0/x
	iqBLafRLBUIYZBM7mZb+KkE/DIA1rJYHcF6YPEukjuGHT8WUw/O9oWJ7
X-Gm-Gg: AY/fxX5Ns5ea92pNsZ64vnFKCRbMdkX/zGlUkVCZbnYMKccpTWczlteJYsIproPoQEd
	Ac4MoAPML18+emEmy3E3Rm6J7qfR6mUzK5biCH4uGrFuC7zFUA1DNbBfSB07b7nWZ0sQB+GX3wK
	hhxHpj5Sf5oxMpoh6yF4G8QWIZHTecKthaDC2ReBcqCZrreD65lu6S05/8na6zFL4hzl6hFIatj
	vbRP7szSoOEBw1DoD+lpfQxYinccIsEgO/le+2m1PGPDKo9NINYOu86v5PzXdoAV4ZwETF2ei3L
	iTM5Lywyl+Sn4+gGM8dUFU/iOkqeOSCTgsAcercsmmDAM+UWrIS5F2eGn5e+MLZHskk7fAfjzbc
	/JYlfNIIB4YmwiJHyaG12HVSuGzNeHACv7pEnox2+umxW6cBHaw5Ez6JKiG0uUFlA5597orwBp+
	aXQfoTZ21kDBqb7+hM5QTaT13QtQoZ5Q==
X-Google-Smtp-Source: AGHT+IEwgFQoT6qI08G95oHchDEjjGEhvVdx57kWehu/9O96BbjgHzcPqrjy1Acp6iwhXUgPqgye5Q==
X-Received: by 2002:a9d:4c94:0:b0:7ce:5139:301b with SMTP id 46e09a7af769-7ce5139308emr2469509a34.8.1767885331763;
        Thu, 08 Jan 2026 07:15:31 -0800 (PST)
Received: from groves.net ([2603:8080:1500:3d89:902b:954a:a912:b0f5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce4781c286sm5799755a34.8.2026.01.08.07.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:15:31 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
Date: Thu, 8 Jan 2026 09:15:29 -0600
From: John Groves <John@groves.net>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, venkataravis@micron.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH V3 03/21] dax: Save the kva from memremap
Message-ID: <djiagki7jvoyonnr5ajt43xwasgil6j7sfjhs27gbb6uwckyds@i52ef23dwakh>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
 <20260107153332.64727-4-john@groves.net>
 <20260108113251.00004f1c@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108113251.00004f1c@huawei.com>

On 26/01/08 11:32AM, Jonathan Cameron wrote:
> On Wed,  7 Jan 2026 09:33:12 -0600
> John Groves <John@Groves.net> wrote:
> 
> > Save the kva from memremap because we need it for iomap rw support.
> > 
> > Prior to famfs, there were no iomap users of /dev/dax - so the virtual
> > address from memremap was not needed.
> > 
> > (also fill in missing kerneldoc comment fields for struct dev_dax)
> 
> Do that as a precursor that can be picked up ahead of the rest of the series.

Makes sense. Actually, I'll just send it as a separate standalone patch...

Thanks,
John

[ ... ]


