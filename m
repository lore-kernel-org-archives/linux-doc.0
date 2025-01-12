Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A08BA3F;
	Sun, 12 Jan 2025 02:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736650781; cv=none; b=oQmM+xn2DswB23JMnNVic8DQ6MkIu8psqgmYo/+rh/U1zUL7MDB90yPAt/VPwneZQ5IDw0IrSwzvWC/tIREAg64NznBnj9/Mmx/g+cGJFwsNEQKwgKjkhOklOCl4H0gSw0FFghVb+itcNa0Olb09In/lTOCBn14b0LhbTR6WkiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736650781; c=relaxed/simple;
	bh=UQiWZy9Hce83yQ8N8shy2AGlCcGuJzpgUAo7kaObTys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1xMYN45s3VyBXf2xm4F2zASSw45FOf62OkevflD5/4VEmfivkQQIAjO+7rLWjvDJHUQsVzFEp/eBRSJuvNhi0YBJCX1IPbNyuWXZcPd7lhLHIFaX++8qHqtwVv7O+c7vAviQ7ws5Kerz+AFQujqVOy+zq8HzXnNTGII8JI8Brw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQM8o9iY; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQM8o9iY"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab2b72fb3c9so570064366b.0;
        Sat, 11 Jan 2025 18:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736650778; x=1737255578; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrqPRw3aH8IZUqpi/lxgVfYANsNMzxjEAHaY51a4Nm8=;
        b=lQM8o9iYznoUmMl9TrWYL6nPZChCq7vFgNTn19/iQ7OIP0H5TlI4vyvp2JXLbQQEG0
         wI1KZ1ivAs921Vj4ecRjsAvWq5z2Etzw6CvFnIL12Q5s3F17pcMN6MajaQrXsa8+TULx
         Mh9oRqOghs1tHqWcsVVDUikmM7KBt2LBmtIZAC2iCYHJ+IpbwKigZXJJHlNpE/ONXBPE
         fK0f3IXBzluKeg2xxIN2Pit6wHW74/B9/FWAAF3LANNVLI0y2NCBkhvy7fjokushAAyf
         cb7NB4gVjnkGqZVVfIzc3DVY52Jrn+Qq1+pjdKuCNMtWB3WTHUFfVN0Wm49onYcvVGRt
         3GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736650778; x=1737255578;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RrqPRw3aH8IZUqpi/lxgVfYANsNMzxjEAHaY51a4Nm8=;
        b=F8I7/0ArnpBraS0y0Q+Ia2/uNoiKi+axNef0ahxrVV66Wf+B+cNRep0SAVLZ5f5Vgw
         8/yk+QTX1zTkZzbluF9toRO2lB8FxqAdOyinbgvB2oFpEh28OGAmn3TcOsSbUO03q+zP
         pR486tM0XaNUSXCl2wFDkzwpsfppfDIuGYw7YBKhPxdDwFU3JkZKE7cA1xNcDpYXjbNj
         sYHK6SGcrdNrpzkAKIAMEgW/macXeMw+XNADf0lmp/lUF4T6tndfZQyO+DOAO14wBRnc
         xSGSat5CIvvaHDiI9DgAviq5ZKQ9p98GUb7YT4Cq66Bz1ig64/Lu/i98mpieM4omFsi0
         JYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVAWb1LsK0g/wQvJwdwrr2lOdtm31unPPj+svWpmmAsyDLDWYniRp/q78/+OAvKH3DR9Ajo0bo8c8=@vger.kernel.org, AJvYcCUus3msOG06qihNajBDU7I967da00EPV3yfKZWagK+jp/KFPGQ2mCBmdpTDNJCI+wfuM28jZbrsmtohOsHt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq8Piy8WDYji7tmUzJP+PD6gP2w3iN9mPvbFvPLSBkQ3BfMS7n
	lUMJZVpK8wUH3Ky108kLqsEb3zQI1sMwMiaTXy42t+lWzVBo/H2U
X-Gm-Gg: ASbGncuxiCHwrKIvZHgsBETnkbe70oVWJxmYydIJHowkViKoKEH/xFRxXfeF+WDzDYH
	iKShUCOY41siMXUQRrLaG32rouwPjTuMnQzgVE0ej6DrRxeUjq9fE/qVu9ydb7lgISe1ZIw4DXw
	oW5XFJP/0+niuw4kACD/6thzki8LYyPLs8AOiwWkExhXuvyPBKIN5w9tbNJMhoyd+kupUeo1cmI
	DfS7FS1A9iB8IMcbVb2sAFFldwvdcmGfgwDt3tLP2eQvESxzwez3mdZ
X-Google-Smtp-Source: AGHT+IGL45YfS3dew6ix676E1fwhmaYpN8O7dGGDaVNtkw9TXBYT04xKHksdRqa56a7bea7Mg3DFNQ==
X-Received: by 2002:a17:907:1b17:b0:aa4:cd1e:c91b with SMTP id a640c23a62f3a-ab2c3c451a3mr1137071066b.7.1736650777876;
        Sat, 11 Jan 2025 18:59:37 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905ec09sm326542966b.32.2025.01.11.18.59.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jan 2025 18:59:36 -0800 (PST)
Date: Sun, 12 Jan 2025 02:59:35 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com,
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250112025935.7mxi3klm5ijkb73m@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-12-surenb@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
>rw_semaphore is a sizable structure of 40 bytes and consumes
>considerable space for each vm_area_struct. However vma_lock has
>two important specifics which can be used to replace rw_semaphore
>with a simpler structure:
>1. Readers never wait. They try to take the vma_lock and fall back to
>mmap_lock if that fails.
>2. Only one writer at a time will ever try to write-lock a vma_lock
>because writers first take mmap_lock in write mode.
>Because of these requirements, full rw_semaphore functionality is not
>needed and we can replace rw_semaphore and the vma->detached flag with
>a refcount (vm_refcnt).

This paragraph is merged into the above one in the commit log, which may not
what you expect.

Just a format issue, not sure why they are not separated.

>When vma is in detached state, vm_refcnt is 0 and only a call to
>vma_mark_attached() can take it out of this state. Note that unlike
>before, now we enforce both vma_mark_attached() and vma_mark_detached()
>to be done only after vma has been write-locked. vma_mark_attached()
>changes vm_refcnt to 1 to indicate that it has been attached to the vma
>tree. When a reader takes read lock, it increments vm_refcnt, unless the
>top usable bit of vm_refcnt (0x40000000) is set, indicating presence of
>a writer. When writer takes write lock, it sets the top usable bit to
>indicate its presence. If there are readers, writer will wait using newly
>introduced mm->vma_writer_wait. Since all writers take mmap_lock in write
>mode first, there can be only one writer at a time. The last reader to
>release the lock will signal the writer to wake up.
>refcount might overflow if there are many competing readers, in which case
>read-locking will fail. Readers are expected to handle such failures.
>In summary:
>1. all readers increment the vm_refcnt;
>2. writer sets top usable (writer) bit of vm_refcnt;
>3. readers cannot increment the vm_refcnt if the writer bit is set;
>4. in the presence of readers, writer must wait for the vm_refcnt to drop
>to 1 (ignoring the writer bit), indicating an attached vma with no readers;

It waits until to (VMA_LOCK_OFFSET + 1) as indicates in __vma_start_write(),
if I am right. 

>5. vm_refcnt overflow is handled by the readers.
>
>While this vm_lock replacement does not yet result in a smaller
>vm_area_struct (it stays at 256 bytes due to cacheline alignment), it
>allows for further size optimization by structure member regrouping
>to bring the size of vm_area_struct below 192 bytes.
>
-- 
Wei Yang
Help you, Help me
