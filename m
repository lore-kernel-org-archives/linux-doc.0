Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18AA32F756;
	Tue, 13 Jan 2026 03:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768274967; cv=none; b=jb9blmIHdEkY7mezU/0R3Oz/E2q6TwF2Y/e7dDXOqDTgXbeOITeCqUP8qgrmvxGnzs6Os0b46zRhWyBnW0f9NHxesI9bw+C6iwphtPCylGdQV4EL91yY8iQ7Hda4CkFf2HcjEgzlAwhweyfIxYT4Dogbse6Oe6cu2h36Qdsr+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768274967; c=relaxed/simple;
	bh=Z0pv5t00X+m40IZFR/9YcLeKNpM77T7BRom0g+Hf3E8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bw9hI8kUFHbrV0DYtS0gVddGxhpA0HADqPQrXjr9MH53om8L9LtoAyUT2tqc7o2Llu209G3xfMLsw+NHjSeFj5UUIoPgpe16dWe2IykrVwKT91rKEWmDIj+fRryTxZ+wvNJ7Tl9I8m7NsVIGZOsF9Ozvv+iYE1I1HVpvszndExA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KbZFLqAc; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KbZFLqAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0J
	i4TaSWr8IkhQZkimpMfWwJazZdbadNYrKKqL15LiI=; b=KbZFLqAcrkJ2BPnWFy
	qr0HoAVw5PqdqjpihkE5fMmMGtKDPkLh4kPKP1/mXn4k9nPg/nEqQMX6kUhsxCvc
	KInCRUeyhsX0PVh/DICnJSrLcCWQ6eoMiwTAYiTIMQ54xr0ZebdpwHwyQWAJIqx1
	jD8fTOzLE7AH/YM6aHVqzhVKo=
Received: from ubuntu24-z.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHsO+nu2Vpjun8LA--.33S2;
	Tue, 13 Jan 2026 11:27:38 +0800 (CST)
From: ranxiaokai627@163.com
To: kent.overstreet@linux.dev
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	ran.xiaokai@zte.com.cn,
	ranxiaokai627@163.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@suse.cz
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot parameter
Date: Tue, 13 Jan 2026 03:27:35 +0000
Message-ID: <20260113032735.161838-1-ranxiaokai627@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aWMLQkvushKidjQQ@moria.home.lan>
References: <aWMLQkvushKidjQQ@moria.home.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCHsO+nu2Vpjun8LA--.33S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWfuFWDGr4rKry7trWrXwb_yoW8uF45pF
	WkGF18tr1kJ3s2kr17Aw1IgrySyr48Jr4aqw1DWrW0ywnrWF92vrWI9FWSyFnrWr93Ca18
	Xa1ava40vw4jv37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUo5lUUUUUU=
X-CM-SenderInfo: xudq5x5drntxqwsxqiywtou0bp/xtbCxQrMGWllu6oN3QAA3X

>On Fri, Jan 09, 2026 at 06:24:19AM +0000, ranxiaokai627@163.com wrote:
>> From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
>> 
>> Boot parameters prefixed with "sysctl." are processed separately
>> during the final stage of system initialization via kernel_init()->
>> do_sysctl_args(). Since mem_profiling support should be parsed
>> in early boot stage, it is unsuitable for centralized handling
>> in do_sysctl_args().
>> Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
>> the sysctl.vm.mem_profiling entry is not writable and will cause
>> a warning. To prevent duplicate processing of sysctl.vm.mem_profiling,
>> rename the boot parameter to "mem_profiling".
>> 
>> Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
>
>How was this observed/detected?

Actually no kernel bug or funtional defect was observed through testing.
Via code reading, i found after commit [1],
boot parameters prefixed with sysctl is processed redundantly.

[1] https://lore.kernel.org/all/20200427180433.7029-3-vbabka@suse.cz/T/#u

>My reading of early_param() would seem to indicate that
>setup_early_mem_profiling() is getting called at the appropriate time -
>and then additionally a second time by do_sysctl_args(), which then
>becomes a noop.

In the handling of process_sysctl_arg(), it at least needs to call
kern_mount("proc"), file_open_root_mnt("/proc/sys/vm/xxx"), kernel_write(),
and filp_close() for processing.
I dont quite understand why it was optimized into a noop.

>So the only bug would seem to be that the sysctl is not writeable in
>debug mode? There's an easier fix for that one...

 - When debug mode is enabled, a warning is triggered because the file is not writable.
 - When debug mode is disabled, do_sysctl_args() cannot handle boot parameters
   like "1,compressed". It only accepts writes of 0 or 1.

As mem_profiling should be parsed in early boot, so this makes it
unsuitable for processing in do_sysctl_args(), which is why I have renamed the parameter.
But as Andrew mentioned, I did not consider the backward compatibility issues.

