Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA29C8F0;
	Mon, 13 Jan 2025 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736729985; cv=none; b=pqqdetopy/T/dYtGOrSQ9nX/zD/9Cz/2FIOJnfzc2pDWVCzHkf4TzwWoLv92DvudwBc0tBtUJaD6Syqsgk7A6iVWqKpPkpO7wvpbxbGcI/rDg0h7dFN5gPoAA9JuES2VdS+evSxQ0tQ6cZmbGbKdOQvUeR9+/sTZ/ImvuuqOXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736729985; c=relaxed/simple;
	bh=ihr93J5DpjW6cGwkazSyRpslNs3pNGePt9MzwF8HbDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mitoVrlYVZheFZclGU765/3NN4U4sGxEWNB8zIDXUb+DVaDy9EqIvWbleoMBben13UfwbVtiDgZleX2523UCsTUK2o919pmh8fKiVOvfR5tgqbk0dj8dAv9MJg5oiG+0M3V6WdURFaSR2FKeKEQFO/orvERuW5ylzvYYw+x3Vlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUFQml3v; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUFQml3v"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso788369966b.3;
        Sun, 12 Jan 2025 16:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736729982; x=1737334782; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqoVsr+gl+qU6mNlGZCrGV8/sQ0hkkQo1zBCKybybuc=;
        b=IUFQml3vHGkT/rbdXwyi56kCKLZhrGUlnhShqUF5bmLziPY/D1asdYfij+z0YS25fh
         AvQSHVxcz73UaG9H5M6VBXcvDaabX759ykqfAexyJ4IVmg8gMqpf0tZPDqJ1YpmKvsCQ
         w2fa8CzX4Wx0IxjJSgnn5Oy2qOSd/UISmUY7ZQX5tZhaCSMtyrWLvQ2CI/annnrKnkib
         WKIfGz3pJDKoN23rkp00fGCsNy5qVSRln+VkeumDBGWCnSkfXS2p4PVMKd1/Gpj6AKMv
         p68NXg8Yq/Q9MA1fNLopL5mdkz34T4abmsgCKgIfxeeNLOmgnlUE707GnF6h5pHuOBjJ
         zuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736729982; x=1737334782;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqoVsr+gl+qU6mNlGZCrGV8/sQ0hkkQo1zBCKybybuc=;
        b=nhPSSv4gw83v9Vd6/J4PIGsXtrngqwlHcA8WEoTcxePeJ7iM+OKUmUcvhQnOPhrReq
         pWZJzVEfB0lqLNu+gmNm5RIZbugYGPWUIoVpNid2umyZQex9y7HkyCUUJqOyIxhNOk+Q
         I7cRFjm/F+YGSlIBoq5rFt5YNyoxnciBi9+Qd0WzRRRbvWZzZuThdTEwpRly6lGDbiGs
         ch760kL0G3+15U61fhJrZLAUZjpr8TVRGhw0ZYmF6ZNuD6dTzkTUE26LjCPKDBKNlK7X
         H1O//vnhpLSROfyZ5YQYLBrK1gF+tMcS/VyzuJefaIUSol4ms4RkwLlbiX0azn45iVGg
         dqqA==
X-Forwarded-Encrypted: i=1; AJvYcCUWua+lbeWOvmfC4TAEPicWTUpVg+lqylqXdTuAlQPoRc5fOwUHhIvXLbcsaNGvjZWv8dMDkdWEmgM=@vger.kernel.org, AJvYcCVkBQM2XIlY0grjev1PIVqgD6Uz1FMkdj1IFw3Fs/Lt0dgSTna37GuH8c8XMsUaGshwDJuq6NMZst76LifG@vger.kernel.org
X-Gm-Message-State: AOJu0Yztm+bFuVZzCazVWhuWks+6519Weep9ZPD0KiIhqo/l3XTsXfsr
	LGY4cHpL1bEFZHA/AAYmXB7bvcTlMVpn2Wf36Osxlkdtg+No6cbW
X-Gm-Gg: ASbGnctq5JIiNAtgfkpb16RsiNqqt2yYasY9I2ef1tpNEK/5kt92cvnJwm1kPW9pSVJ
	Lv4SZ5FcGoYEZC1ImXmNDPH9WS0yiglfTwO9eKdJMmjvPzef5sOPVQwxuiA2HAFMTQIIR7XQOhi
	Ba4VGcjt3GhPTJRojDTTmk7o3BgR4GHmBt0V0/pjIL9c2xeTeYHFz6t8ts4QyOnxKY10kwT4gWp
	/N56WqWcDbhEL80VT1z6sGluqmmpC8hQ4TjfLgklsb0riOHLBGdBs15
X-Google-Smtp-Source: AGHT+IH5JODZaxJICK+di56Xe/cEypRJHvNMlxUm/IAxEz/jWwFJvuN3fKscCjadO1CYYI++0Evezg==
X-Received: by 2002:a17:907:7f24:b0:aaf:123a:f303 with SMTP id a640c23a62f3a-ab2abdc5a93mr1702565066b.55.1736729980973;
        Sun, 12 Jan 2025 16:59:40 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060e27sm439573066b.13.2025.01.12.16.59.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 16:59:38 -0800 (PST)
Date: Mon, 13 Jan 2025 00:59:37 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250113005937.b5xp67uksxyf3g7b@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <20250112025935.7mxi3klm5ijkb73m@master>
 <CAJuCfpHNdH1oYGoRidTnrWO07-tjR2ebEzzb64=jySw+hkXRKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHNdH1oYGoRidTnrWO07-tjR2ebEzzb64=jySw+hkXRKQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Sun, Jan 12, 2025 at 09:35:25AM -0800, Suren Baghdasaryan wrote:
>On Sat, Jan 11, 2025 at 6:59 PM Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
>> >rw_semaphore is a sizable structure of 40 bytes and consumes
>> >considerable space for each vm_area_struct. However vma_lock has
>> >two important specifics which can be used to replace rw_semaphore
>> >with a simpler structure:
>> >1. Readers never wait. They try to take the vma_lock and fall back to
>> >mmap_lock if that fails.
>> >2. Only one writer at a time will ever try to write-lock a vma_lock
>> >because writers first take mmap_lock in write mode.
>> >Because of these requirements, full rw_semaphore functionality is not
>> >needed and we can replace rw_semaphore and the vma->detached flag with
>> >a refcount (vm_refcnt).
>>
>> This paragraph is merged into the above one in the commit log, which may not
>> what you expect.
>>
>> Just a format issue, not sure why they are not separated.
>
>I'll double-check the formatting. Thanks!
>
>>
>> >When vma is in detached state, vm_refcnt is 0 and only a call to
>> >vma_mark_attached() can take it out of this state. Note that unlike
>> >before, now we enforce both vma_mark_attached() and vma_mark_detached()
>> >to be done only after vma has been write-locked. vma_mark_attached()
>> >changes vm_refcnt to 1 to indicate that it has been attached to the vma
>> >tree. When a reader takes read lock, it increments vm_refcnt, unless the
>> >top usable bit of vm_refcnt (0x40000000) is set, indicating presence of
>> >a writer. When writer takes write lock, it sets the top usable bit to
>> >indicate its presence. If there are readers, writer will wait using newly
>> >introduced mm->vma_writer_wait. Since all writers take mmap_lock in write
>> >mode first, there can be only one writer at a time. The last reader to
>> >release the lock will signal the writer to wake up.
>> >refcount might overflow if there are many competing readers, in which case
>> >read-locking will fail. Readers are expected to handle such failures.
>> >In summary:
>> >1. all readers increment the vm_refcnt;
>> >2. writer sets top usable (writer) bit of vm_refcnt;
>> >3. readers cannot increment the vm_refcnt if the writer bit is set;
>> >4. in the presence of readers, writer must wait for the vm_refcnt to drop
>> >to 1 (ignoring the writer bit), indicating an attached vma with no readers;
>>
>> It waits until to (VMA_LOCK_OFFSET + 1) as indicates in __vma_start_write(),
>> if I am right.
>
>Yeah, that's why I mentioned "(ignoring the writer bit)" but maybe
>that's too confusing. How about "drop to 1 (plus the VMA_LOCK_OFFSET
>writer bit)?
>

Hmm.. hard to say. It is a little confusing, but I don't have a better one :-(

>>
>> >5. vm_refcnt overflow is handled by the readers.
>> >
>> >While this vm_lock replacement does not yet result in a smaller
>> >vm_area_struct (it stays at 256 bytes due to cacheline alignment), it
>> >allows for further size optimization by structure member regrouping
>> >to bring the size of vm_area_struct below 192 bytes.
>> >
>> --
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me
