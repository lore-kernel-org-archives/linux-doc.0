Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E43C4B75;
	Tue, 12 May 2026 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600796; cv=none; b=Lwk2Sa2Pyy8tTMbSO+syJZf9wYiyTt0KwBgBndb6TMm7F3Av+m9vPNrRMJ13k/P0q9lgYHiLCRaRX1OM0HybM2yQpHMz4umzCOhE+PmlzLm/gj2LpavSY5LVNa9fjWwzNN4dnuaNY/fIAOCRGQXiGd4v8XgWkPCFTZQ3Oqlt448=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600796; c=relaxed/simple;
	bh=F3Zv0JOKesguZ6mhZPtk7Bxo1cTD1wvwqglFXShDibk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlhXg6klpEovQkAq3E0lALpEGg5L7yKUR3SkcLQ5X78SJD+xA08icU8egt0fB2nhDhwWmtZzfZUvlYJCo5/M734kyN8N1z/8HDrgQkzF3Tj1VyuRUJqVkxBGfxhcp5BPt6sHOUwUvSiCSAMA3xhq1BP8D61utYqzU129jcCC7WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=XbmfckGv; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="XbmfckGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778600789; bh=PaMGqz0yXQud2fUYhL55qTFHjZOzYISIsf1SBK7STfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XbmfckGvzcsHdU+UB0IlLBwYz9EScvSXrzGN/0+jG55hyHp3YWazy8SPFpGzRINqP
	 csuiKCJg9oejnseq1zoIetvqJqY0abPbiwds1E7ogS973qQjlTZmzMF3/vtJX9bCvP
	 xQCEQNbBRT54kVT4/dqyMhvTOUCOTLNd2sZu08uc=
Received: from [192.168.1.9] ([163.125.219.25])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id B99B08E3; Tue, 12 May 2026 23:46:25 +0800
X-QQ-mid: xmsmtpt1778600785tygo1jak2
Message-ID: <tencent_A4DCA5C6722BCBE54EE188648C04E1EF9D05@qq.com>
X-QQ-XMAILINFO: NmRjDopJZVxOTAKLsNw0LLOXTd45SkTyOnrqbQtvq0ZsHNUVyw2XOX82gpvEq7
	 Z6P4y4uF/Qj6DS6cmYj2Lk1MxFmlg7IMR9ns/aUeG/LRVAD6QTNOCHhbu4IlK+IJUu/4mHOhlrjy
	 f5CzBqFx825RSGmbXIrFwpIRPrs37b8BqDhuA3XXocb7qYLOwlx8sc37Vxupe5qhZVQeVEel0Qk/
	 2f9iWLIetidIFTtahJ5n1rfan8N7osuXy2jFWG0kTqxIrO3O1TdGX3/s1lRFasA+5ONDLbMKy0ic
	 FUKMs8NZcXzE3YbyGoO9/3YbVt7zB4l+ls8Y25iOSkgb3FSQyYhCmGDH6ZFeZPY5N9KB+wyOcrWZ
	 X8vC0tQK41Mdk/IjH+9K74fKAR8vbppWdy0wKIITZKaoOuOgEgOrInd4BYMBCasrNtmKhruA0qjF
	 q9OhQ+jbAvZeeWMwoHgSdzuSCK0cLzQNU8CaRMfWyVJ2ni3pNvSVGR0r3TS87mMlKaHi0RDMigOc
	 MKT8niY7Xn8U0wzM3usktFMQ4DQSfKEXHxDRzEh+iw6VddstcC3FlJ0OtMm6jet+KMuMzfObhHAE
	 pCSPi/HhwfCNOmkJoKYcRC90GCA2vLHVPw7RCNxaPr9jyT+JFwFfUC60FoBtURbwoIwSGFzyO5V9
	 iFWs6N+d6iojl/lXuenlX3ITbsjtQZ0wptZJSjVvNV9N6LCK3ljP9OnwukIJu1Ss3BjjuTfWJT0y
	 xoJ2Kow8Icb6g4z4lkXJ/dPDJunrHTno9fVRerkrEGz5dVE4JxfGPfaHSAJqvd6ltdIhE7+8VSsb
	 V+GdlbBrDdoYuyg4vUIoBGlEoUbGWcuZKX0lzonxS4dlh/G+ntxXtiJb17xx9Msz+ktypOg2OKmr
	 YXv1iUx5+9g89c7O1hzqjJGkudJbaUQbO/77udKQbQjv5fyKuRJHRy1Np51Y/UXp2IQYke4MN0Gy
	 ZtDJCIukHKq5EqUIkE8UEij9jPTZ1PIuz6voVL/AD2xH1vjycAW9SaRB9uaveMmh4LI7UtN12Qn6
	 sJ5SBrAAf+GRifoQNU9UUXgAlLJ1SL90Ztsmd3vj5A1e8TYorBWg9iw+o3nXDKKiG9cPFbIg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-OQ-MSGID: <c0e09968-4c60-495a-b03a-0dde22b444a0@qq.com>
Date: Tue, 12 May 2026 23:46:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
To: kernel test robot <lkp@intel.com>, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, kees@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
 dzm91@hust.edu.cn, tony.luck@intel.com, gpiccoli@igalia.com,
 frederic@kernel.org, jani.nikula@intel.com, longman@redhat.com,
 mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>
 <202605111009.hlpiVkT6-lkp@intel.com>
From: Yan Zhu <zhuyan2015@qq.com>
In-Reply-To: <202605111009.hlpiVkT6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 5/11/2026 4:39 PM, kernel test robot wrote:
> Hi Yan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v7.1-rc3 next-20260508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhu/docs-zh_CN-update-admin-guide-index-rst-translation/20260511-102406
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A%40qq.com
> patch subject: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260511/202605111009.hlpiVkT6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605111009.hlpiVkT6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     Checksumming on output with GSO
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>     MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
>>> Documentation/translations/zh_CN/admin-guide/index.rst:114: WARNING: toctree contains reference to nonexisting document 'translations/zh_CN/admin-guide/module-signing' [toc.not_readable]
>     Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.
> 

This is a false alarm. I generated a patch based on the following 
warehouse. It exists in the module-signing document:
base：git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git 
docs-next

Thanks for your attention.
Yan Zhu
> 
> vim +114 Documentation/translations/zh_CN/admin-guide/index.rst
> 
>     113	
>   > 114	.. toctree::
>     115	   :maxdepth: 1
>     116	
>     117	   cpu-load
>     118	   mm/index
>     119	   module-signing
>     120	   numastat
>     121	
>     122	
>     123	Todolist:
>     124	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Yan Zhu

