Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546618659
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="XzvB6sbo"
Received: from mail.zytor.com (unknown [IPv6:2607:7c80:54:3::138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 068C8109;
	Tue, 24 Oct 2023 12:15:02 -0700 (PDT)
Received: from [127.0.0.1] ([98.35.210.218])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 39OJERvQ3400109
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 24 Oct 2023 12:14:28 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 39OJERvQ3400109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023101201; t=1698174870;
	bh=JdRN/5MJBM/LR3Jboog2UEEm4N1T8ZmfUjckQ5zsnPU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XzvB6sbofNBXw3tkVUrVcKv2C+OIILQqGCQRAgCMRPD8LBmnMW1CYgKpXXHei0kP5
	 9zW8X/C3SVXfkwus6UfhI0n9e9mlq0F30lcFudjaxCvDgv07QolVOXOxU1It4NnA3p
	 9gP9Yupsmo+9X/6zzrJ5eqiSypmzNjcC54w259e1ZDY2bwmk77Q1eWU0zfnjysOW8g
	 HAT4pC24RRtwLeDLKbwcYMvkxHx46G2wcIaWU6cMswjvNlplK+kRCW3OeQpHaG1rWH
	 l0Y08WDtOI6RbGWAj1g2SznPDHpNzT2VJ+YJcAS65QnDxCWHbOXTF3inbCwp6t3MKg
	 YDqnenxLabZeA==
Date: Tue, 24 Oct 2023 12:14:25 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Luck, Tony" <tony.luck@intel.com>, Peter Zijlstra <peterz@infradead.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        "Lutomirski, Andy" <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "Christopherson,, Sean" <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "ak@linux.intel.com" <ak@linux.intel.com>,
        "tim.c.chen@linux.intel.com" <tim.c.chen@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        Alyssa Milburn <alyssa.milburn@linux.intel.com>,
        Daniel Sneddon <daniel.sneddon@linux.intel.com>,
        "antonio.gomez.iglesias@linux.intel.com" <antonio.gomez.iglesias@linux.intel.com>,
        "Milburn, Alyssa" <alyssa.milburn@intel.com>
Subject: RE: [PATCH  v2 1/6] x86/bugs: Add asm helpers for executing VERW
User-Agent: K-9 Mail for Android
In-Reply-To: <SJ1PR11MB6083E3E2D35B30F4E40E8FE7FCDFA@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com> <20231024-delay-verw-v2-1-f1881340c807@linux.intel.com> <20231024103601.GH31411@noisy.programming.kicks-ass.net> <20231024163515.aivo2xfmwmbmlm7z@desk> <20231024163621.GD40044@noisy.programming.kicks-ass.net> <20231024164520.osvqo2dja2xhb7kn@desk> <20231024170248.GE40044@noisy.programming.kicks-ass.net> <DD2F34A0-4F2F-4C8C-A634-7DBEF31C40F0@zytor.com> <SJ1PR11MB6083E3E2D35B30F4E40E8FE7FCDFA@SJ1PR11MB6083.namprd11.prod.outlook.com>
Message-ID: <5B8EB5F2-16A7-47BC-97FE-262ED0169DE3@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 24, 2023 11:49:07 AM PDT, "Luck, Tony" <tony=2Eluck@intel=2Ecom>=
 wrote:
>> the only overhead to modules other than load time (including the runtim=
e linking) is that modules can't realistically be mapped using large page e=
ntries=2E
>
>If there were some significant win for using large pages, couldn't the
>kernel pre-allocate some 2MB pages in the [-2GiB,0) range?  Boot paramete=
r
>for how many (perhaps two for separate code/data pages)=2E First few load=
ed
>modules get to use that space until it is all gone=2E
>
>It would all be quite messy if those modules were later unloaded/reloaded
>=2E=2E=2E so there would have to be some compelling benchmarks to justify
>the complexity=2E
>
>That's probably why Peter said "can't realistically"=2E
>
>-Tony
>

Sure it could, but it would mean the kernel is sitting on an average of 6 =
MB of unusable memory=2E It would also mean that unloaded modules would cre=
ate holes in that memory which would have to be managed=2E
