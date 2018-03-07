Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 317707E688
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 10:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751149AbeCGKIX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 05:08:23 -0500
Received: from mail-bl2nam02on0076.outbound.protection.outlook.com ([104.47.38.76]:39298
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751127AbeCGKIV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Mar 2018 05:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fTHU9SWCgT/tn7ZdBa/tVHUPnUmJzuJsQCovl37V2wE=;
 b=EDmZzBxZ19Tyv4eIM8U/CTxbHukzbr99KCwtQ4cpx7JgVyKC9XdQ6KzZ8nwIPMbh9b+mTeClT1+JSykNweT/bj5Zofsk20pAEYGETtmqP9nx4M4PsqOPQUt71mlsH/vaiX/1tJaQI2Qk+UsJzJEwYhFdCc0HPUt7PINJMCylLZo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yuri.Norov@cavium.com; 
Received: from localhost (50.233.148.156) by
 MWHPR07MB2909.namprd07.prod.outlook.com (2603:10b6:300:1e::21) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.567.14; Wed, 7
 Mar 2018 10:08:12 +0000
Date:   Wed, 7 Mar 2018 13:07:55 +0300
From:   Yury Norov <ynorov@caviumnetworks.com>
To:     Chris Metcalf <cmetcalf@mellanox.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rik van Riel <riel@redhat.com>, Tejun Heo <tj@kernel.org>,
        Frederic Weisbecker <fweisbec@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Christoph Lameter <cl@linux.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Francis Giraldeau <francis.giraldeau@gmail.com>,
        linux-mm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
        Narayana Prasad Athreya <pathreya@caviumnetworks.com>,
        Alex Belits <Alex.Belits@cavium.com>,
        Chandrakala Chavva <Chandrakala.Chavva@cavium.com>
Subject: Re: [PATCH v16 00/13] support "task_isolation" mode
Message-ID: <20180307100755.afewiyhkdxytdfnl@yury-thinkpad>
References: <1509728692-10460-1-git-send-email-cmetcalf@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1509728692-10460-1-git-send-email-cmetcalf@mellanox.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Originating-IP: [50.233.148.156]
X-ClientProxiedBy: VI1PR08CA0123.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::25) To MWHPR07MB2909.namprd07.prod.outlook.com
 (2603:10b6:300:1e::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f499d81a-339f-41e3-6d71-08d5841356dc
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:MWHPR07MB2909;
X-Microsoft-Exchange-Diagnostics: 1;MWHPR07MB2909;3:pNlJRdwSRV79yFIz8QuOvjzwLVeVuRdMKXMPj8UDiDUHmKQWVwrXRVkgYY8j5PTxh3LdCM00joBKK35CuvhIsFsK6Megh7bJ0HxUuU+N7d12yH7NEdwHdYyGVe4GphAsjCxQiX6mkq4nfFFwimL1THq2PD+Jxe4ExR3SRcxIHI4omKORN4i/xPbK8FaR10rRhTSekWo1j9wyD30bzV6v0sGdc6PT7BY1MwPqFRTf4wc9inexD9q8y35POY+0r3sS;25:Bf1Yq47g+TA3fgErNn8NoZ3J/hwTQteqDRh0kVNjiLmigijYOkhjaDO2bb2SyCR6jUHye/m7+7qjCWBd+bTxbS+aUTNU/pqUEv78UTcTggqsNKRyPuu763upjuBHYcXAJuneWHGW0UshkTcgzWknrVjXf5+cjIhGa0S+NfPWVo3B0YL2SfIjwndYeRGNGnwWdAnItoQPTShTBZUBihm/jRSo0GjFjjMCbuDbkkcjr3IygBvyntcgNy1LFocJDjalIMdCESHU6Cvv5ifdNIGg5tNPArLaTcbRnXof2FV17/u1Jy44Pzn1SHF3OL/tbmeLKvXXxyvpKvRbQjG/EzCb4g==;31:2E2dUTXmoMtgVaYWMu//ds+0jYbX6SdY7hHpgSvG4MvxRaEjT2pNxID1oBiCXHOntnAWFeyq4jREZKr4xQBL/MMf+FtcIdY/mhDO0W775aaephXMcsT2HSUlW+FuOBAlfRuNt9Pl/f+w5fOEtZVwOgiYJBVPKD9oiOSCx98IM+CkbXi+Z9g5zqBMUv7uoUG5AKl5DxFH0iJRLmkD6vuhrima+PpKHThk+k7DJg4oOhI=
X-MS-TrafficTypeDiagnostic: MWHPR07MB2909:
X-Microsoft-Exchange-Diagnostics: 1;MWHPR07MB2909;20:2QOO5desWfAKgr6T+55rAgzGFKBeWd0qv4d6wWO7p2YrB/wjpGg0Fn1cVXMIzZVsUJlCPxi5ukJkY9Yx9Rifkb9r7OsTRmH1JHjnDuzZudvYE5ZIaFSbpgBMDmEBez2lPLttg4XmhYyDaKx+qpVHlWGsU70vVSRUtQdO17/Wg51Aqr7Pg9J9xP/4u9dFNi1ANABtTnlkYepyd/zE7o6FaHUXIh5RVPqMR+iNkoIhbJY34xeUccX+reMvazLhPnp1QxSa/35Uy3iCR46hnfvxV1MkM6npJjIffhfZZ8FszFHSp8o8gcAI2PbkCGGFrAm5OVonmfYVjxd6JWz1cQ/vAYafe4XU+dECOCzhQyxeg7q27wPVWeRui+ZEMjkqGdXK1K+kfPIrqcLL8Wxc2KNUPhjM8RkimQiPCcfoa5z+uQBLDANnDpGYFFIm97lgcA3ObMetauRsFqcBAwgh6dS0yBa9AmURSU/FeGTpCdIY3jnNoiiwj+J1/jKLaxdsRlrtjY/SiiZrQu6rkdBZ2HNq8bwiGpqwB92SEH1tGTwhyNwAYTFV5A/G8hI+8kIODK6hphV7KFGONCUKqSWdX2Zfc56PPK036EwsnG9Qm/NwOoo=;4:wJ82xcXe+ij2NOjG2b9uBr0/eqSGNlyG6p8rirpzZGCPk4zOxcLDAnHA74c7KvG3EeOhABBXXp0q+UK2mKfESSoXkQFf4NPq9XE7H38OHMe64xWLxHaDSKveQ0d++l5UuXSErY6jUdxjFHCMHoVCy6U3RToq7cNPi4R+vk0VxTWA38LrE0kKc+9O/Jg7Zzl1Wy8ZCv5tUDuwqAjZLJb5MoJ1Zo8nHoGvs3MqoqHN9nauZUXezVeB6iZG5iZ85BQX
X-Exchange-Antispam-Report-CFA: BCL:0;PCL:0;RULEID:(3231001);SRVR:MWHPR07MB2909;BCL:0;PCL:0;RULEID:;SRVR:MWHPR07MB2909;
X-Forefront-PRVS: 0604AFA86B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(6069001)(7916004)(366004)(52314003)(199004)(189003)(106356001)(33716001)(16526019)(186003)(97736004)(8676002)(8936002)(81156014)(68736007)(76176011)(47776003)(59450400001)(52116002)(6496006)(66066001)(26005)(54906003)(16586007)(58126008)(105586002)(107886003)(53546011)(386003)(33896004)(76506005)(7736002)(6916009)(229853002)(6666003)(2950100002)(966005)(6306002)(9686003)(4326008)(305945005)(39060400002)(72206003)(1076002)(42882007)(23726003)(3846002)(6116002)(7416002)(6246003)(3716004)(575784001)(5660300001)(50466002)(25786009)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR07MB2909;H:localhost;FPR:;SPF:None;PTR:InfoNoRecords;A:1;MX:1;LANG:en;
Received-SPF: None (protection.outlook.com: cavium.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;MWHPR07MB2909;23:cPY22MlgJiOrjL5IONkMdcDELJmsamkx7qXSmkdO/?=
 =?us-ascii?Q?Tl8pC7XZksyUentRK0/qlQltyiaUYMX9CAFHmjGAQGOekW/B5brzuj4ngSVG?=
 =?us-ascii?Q?87SUSNG9x+ZVZm9SBgpyb9HNSO+Ae+k3BQMVOXIuksrNfavjI03dBCKB/7ab?=
 =?us-ascii?Q?kcJ9UuvEy57p6R55QkEMyWEBHtrTWnVzZXrr+9HdSNjbiECvoyPLl74w96iA?=
 =?us-ascii?Q?tz9QXIv+RldyywGnUwX+YcmSAFiL6t6RSDOgODI5xtR5ReAXKWAyhTVSfKGL?=
 =?us-ascii?Q?LyWtn4H5xBeo4AsdsOumywtZJWnka5yhFe4WbWA1HPadts2AN54fUKTa1I+t?=
 =?us-ascii?Q?9DK8Gy5vh7D3HB25c2QHr7C+AAIwbD7Gu7ajLfAng811myCqP/YFuqNtgvkU?=
 =?us-ascii?Q?anqdnNhH6IBSBkrC3YIj6yqteowU41jOB+NaJVHEHpWB/X5vftHT6l9zk1UJ?=
 =?us-ascii?Q?nGqSuFKGe1nfJJheKaLULcsqjLVC4r2mMgebLut+P10ci8RtgxS9Ks0P1QHW?=
 =?us-ascii?Q?Ez0Fof/qKeRS2K2Xe6wtpDQEXW6eVUoFCj3m3eWjr8U1DFzi7134Vx7tkxBv?=
 =?us-ascii?Q?5CMTAJqevX7GLyGKCFs9DVz5y+Ovwd2H/kWnJEVAQv4s1F/AaAxl+1527x2O?=
 =?us-ascii?Q?rhO4aWyxgiXT/3t5LzGr2PpBMjijFhBqQ3eySGmdRPm56DYd71zMtdLZzqoN?=
 =?us-ascii?Q?+wyOwN0qAhtxCDGfBXW4FiGw/EdZ+U67x1N3H4fYHwqfwOx1d0SNtd1mwcrW?=
 =?us-ascii?Q?YhdxWa8du4Wd+3eCZTQtAeyBlAudRpD42zipxT8xaFKSJaaR/OdzANJcXQTm?=
 =?us-ascii?Q?aiftv+osTWDrHMQR4AVCTMfEwtyu1YRln3SpOtNXKifGPongIZ0s8QWNl5Ys?=
 =?us-ascii?Q?Jo8+I026Qtt/vqWMl//4fiZ/Gi4VRGEbxo5PVyJQopRFq1IDPlvjrLrbifXj?=
 =?us-ascii?Q?NezruoszmtKtST7tiT5QWXUbKmG3F9z42cKT2a3VsPumP0o0rZRwzkJdLcGI?=
 =?us-ascii?Q?fSiQgQNSwZISKEJWxvbY5kMGeFWnhJJyZAH/Gxo6ot3b87bSSKt7mh1WD6HI?=
 =?us-ascii?Q?uZr2JGNTRl/UK6zHFhQhUGY/7W83gqQPfKKxKlq53P+tDoLzwpkfxAm4YALY?=
 =?us-ascii?Q?6kE0wRbLUt72Dg4xX7teGyTG5PDJqxWXdr63SkvxBr2VnK9ff+Pq7ObncvXY?=
 =?us-ascii?Q?YcQAAcQRPk977P2dC3EQ+KKU/T4N12sT2ZS0gTsKhu/d7c1BXCkaYnl7II2C?=
 =?us-ascii?Q?G61Oq94jfOpb1njt1dCH0TUan28U953RCd8R0sM?=
X-Microsoft-Antispam-Message-Info: pfC53e0wmXsBBh4Wl/uzFkYSTsE1ZrheZHhJRDbt9TVU+zKbPSvv//uJ5H4Lz2a+eZKLMInrmnyg1z8acfWzYNLt+pY54QSrdj8eiUfrW9ft904lmdkyQiYa21HYPHerNmR2BqJjaNpfG9YJx2+20gs1in9DmKfJFpG92rLdJje8XrAHeGW9Ow5xlNQI39Wl
X-Microsoft-Exchange-Diagnostics: 1;MWHPR07MB2909;6:jKZWB2IvelaiF3Ayavxe9SBHEgwtf+pKdI4SUZmPuel8cmb3pLPM8/+prWfsuTXGpzbYAZqgJD0bmVIhV4XlKK84YZilNdgG95Cdj0Bxmc5zuB2Eede9EYjlDxgTopIoCXsbH77FCIFhmGedW0Emr9EYW9sxXfXs7VL56zAaHFWM7u/qHq2CD3HdlvXIrkn3mOs8nnx8Ewfy3Rr2mjeq8VpXx+g+hkgbPkB1WdshdYo4QJg9G6DP51fkq8OHsyPmYMzQOyDAiwrJH9ls6lG1vVmSwwCRrY+R51n7jB5SE2PNVzvVT+yzzSTizJIzv8hABMf9D6LsyfY1gNC57yIGp+I3So79HJMSkwowLfvYxqU=;5:vKlKGc54X4aMTwt+1V3JGRsvlMRmNrHXbCQPA2AqohiTLJ3z32iNNxlF0k7X1aeTkMa4kdFGhKwhKMd1P8228p5kgZBeMpaH/dG7OJIEgnM0oKly2Gf3Ncrcn8YlVZamM5ql9MTe2vH+TB9FLqF5B1G7oLdgyLR8jcl7QgKkDxw=;24:yEN5xfyHupwaUGC5HgE++LnROQJg84QHts5Z3nRqBZ0r251RlectIPD/tb5b6hwejmfQLkUAPJEIpPxxHljbsglx872o8XD0dxYRuhT4q6U=;7:aC5Mil0yTj8a49ji8/B8Hg+DyG52udm33PNoEHiEGNrg9SONT6ceyErzkAjyuDJLlmjN2yueic6fwrUM19cDa5SipoDwvGFbaJOMabsBKq3NS46FaeCTVqYZXFRN1J8VFDXFwXku8ilcFHDOaBc+3Uv/M33uHeEhegWc4gcoHv8px9atCOTxNR6rV+su9WnLuaEOEp2hj8W4+uy1fmgZtX6SS/UiDzOzFc8PaNKz+skMI1d/DMUUYwZJwkI96muA
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2018 10:08:12.2137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f499d81a-339f-41e3-6d71-08d5841356dc
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB2909
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Chris,

(CC Cavium people)

Thanks for your series.

On Fri, Nov 03, 2017 at 01:04:39PM -0400, Chris Metcalf wrote:
> Here, finally, is a new spin of the task isolation work (v16), with
> changes based on the issues that were raised at last year's Linux
> Plumbers Conference and in the email discussion that followed.
> 
> This version of the patch series cleans up a number of areas that were
> a little dodgy in the previous patch series.
> 
> - It no longer loops in the final code that prepares to return to
>   userspace; instead, it sets things up in the prctl() and then
>   validates when preparing to return to userspace, adjusting the
>   syscall return value to -EAGAIN at that point if something doesn't
>   line up quite correctly.
> 
> - We no longer support the NOSIG mode that let you freely call into
>   the kernel multiple times while in task isolation.  This was always
>   a little odd, since you really should be in sufficient control of
>   task isolation code that you can explicitly stop isolation with a
>   "prctl(PR_TASK_ISOLATION, 0)" before using the kernel for anything
>   else.  It also made the semantics of migrating the task confusing.
>   More importantly, removing that support means that the only path
>   that sets up task isolation is the return from prctl(), which allows
>   us to make the simplification above.
> 
> - We no longer try to signal the task isolation process from a remote
>   core when we detect that we are about to violate its isolation.
>   Instead, we just print a message there (and optionally dump stack),
>   and rely on the eventual interrupt on the core itself to trigger the
>   signal.  We are always in a safe context to generate a signal when
>   we enter the kernel, unlike when we are deep in a call stack sending
>   an SMP IPI or whatever.
> 
> - We notice the case of an unstable scheduler clock and return
>   EINVAL rather than spinning forever with EAGAIN (suggestion from
>   Francis Giraldeau).
> 
> - The prctl() call requires zeros for arg3/4/5 (suggestion from
>   Eugene Syromiatnikov).
> 
> The kernel internal isolation API is also now cleaner, and I have
> included kerneldoc APIs for all the interfaces so that it should be
> easier to port it to additional architectures; in fact looking at
> include/linux/isolation.h is a good place to start understanding the
> overall patch set.
> 
> I removed Catalin's Reviewed-by for arm64, and Christoph's Tested-by
> for x86, since this version is sufficiently different to merit
> re-review and re-testing.
> 
> Note that this is not rebased on top of Frederic's recent housekeeping
> patch series, although it is largely orthogonal right now.  After
> Frederic's patch series lands, task isolation is enabled with
> "isolcpus=nohz,domain,CPUS".  We could add some shorthand for that
> ("isolcpus=full,CPUS"?) or just use it as-is.
> 
> The previous (v15) patch series is here:
> 
> https://lkml.kernel.org/r/1471382376-5443-1-git-send-email-cmetcalf@mellanox.com
> 
> This patch series is available at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile.git dataplane
> 
> Some folks raised some good points at the LPC discussion and then in
> email discussions that followed.  Rather than trying to respond to
> everyone in a flurry of emails, I'll answer some questions here:
> 
> 
> Why not just instrument user_exit() to raise the isolation-lost signal?
> 
> Andy pointed me in this direction.  The advantage is that you catch
> *everything*, by definition.  There is a hook that can do this in the
> current patch set, but you have to #define DEBUG_TASK_ISOLATION
> manually to take advantage of it, because as written it has two issues:
> 
> 1. You can't actually exit the kernel with prctl(PR_TASK_ISOLATION,0)
>    because the user_exit hook kills you first.
> 2. You lose the ability to get much better diagnostics by waiting
>    until you are further into kernel entry and know what you're doing.
> 
> You could work around #2 in several ways, but #1 is harder.  I looked
> at x86 for a while, and although you could imagine this, you really
> want to generate a lost-isolation signal on any syscall that isn't
> that exact prctl(), and it's awkward to try to do all of that checking
> before user_exit().  Since in any case we do want to have the more
> specific probes at the various kernel entry points where we generate
> the diagnostics, I felt like it wasn't the right approach to enable
> as a compilation-time default.  I'm open to discussion on this though!
> 
> 
> Can't we do all the exit-to-userspace work with irqs disabled?
> 
> In fact, it turns out that you can do lru_add_drain() with irqs
> disabled, so that's what we're doing in the patch series now.
> 
> However, it doesn't seem possible to do the synchronous cancellation of
> the vmstat deferred work with irqs disabled, though if there's a way,
> it would be a little cleaner to do that; Christoph?  We can certainly
> update the statistics with interrupts disabled via
> refresh_cpu_vm_stats(false), but that's not sufficient.  For now, I
> just issue the cancellation during sys_prctl() call, and then if it
> isn't synchronized by the time we are exiting to userspace, we just
> jam in an EAGAIN and let userspace retry.  In practice, this doesn't
> seem to ever happen.
> 
> 
> What about using a per-cpu flag to stop doing new deferred work?
> 
> Andy also suggested we could structure the code to have the prctl()
> set a per-cpu flag to stop adding new future work (e.g. vmstat per-cpu
> data, or lru page cache).  Then, we could flush those structures right
> from the sys_prctl() call, and when we were returning to user space,
> we'd be confident that there wasn't going to be any new work added.
> 
> With the current set of things that we are disabling for task
> isolation, though, it didn't seem necessary.  Quiescing the vmstat
> shepherd seems like it is generally pretty safe since we will likely
> be able to sync up the per-cpu cache and kill the deferred work with
> high probability, with no expectation that additional work will show
> up.  And since we can flush the LRU page cache with interrupts
> disabled, that turns out not to be an issue either.
> 
> I could imagine that if we have to deal with some new kind of deferred
> work, we might find the per-cpu flag becomes a good solution, but for
> now we don't have a good use case for that approach.
> 
> 
> How about stopping the dyn tick?
> 
> Right now we try to stop it on return to userspace, but if we can't,
> we just return EAGAIN to userspace.  In practice, what I see is that
> usually the tick stops immediately, but occasionally it doesn't; in
> this case I've always seen that nr_running is >1, presumably with some
> temporary kernel worker threads, and the user code just needs to call
> prctl() until those threads are done.  We could structure things with
> a completion that we wait for, which is set by the timer code when it
> finally does stop the tick, but this may be overkill, particularly
> since we'll only be running this prctl() loop from userspace on cores
> where we have no other useful work that we're trying to run anyway.
> 
> 
> What about TLB flushing?
> 
> We talked about this at Plumbers and some of the email discussion also
> was about TLB flushing.  I haven't tried to add it to this patch set,
> because I really want to avoid scope creep; in any case, I think I
> managed to convince Andy that he was going to work on it himself. :)
> Paul McKenney already contributed some framework for such a patch, in
> commit b8c17e6664c4 ("rcu: Maintain special bits at bottom of
> ->dynticks counter").
> 
> What about that d*mn 1 Hz clock?
> 
> It's still there, so this code still requires some further work before
> it can actually get a process into long-term task isolation (without
> the obvious one-line kernel hack).  Frederic suggested a while ago
> forcing updates on cpustats was required as the last gating factor; do
> we think that is still true?  Christoph was working on this at one
> point - any progress from your point of view?

I tested your series on ThunderX 2 machine. When I run 10 giga-ticks test,
it always passed. If I run for more, the test exits like this:

# time ./isolation 1000
/sys devices: OK (using task isolation cpu 100)
prctl unaffinitized: OK
prctl on cpu 0: OK
==> hello, world
test_off: OK
Received signal 11 successfully
test_segv: OK
test_fault: OK
test_fault (SIGUSR1): OK
test_syscall: OK
test_syscall (SIGUSR1): OK
test_schedule: OK
test_schedule (SIGUSR1): OK
testing task isolation jitter for 1000000000000 ticks
ERROR: Program unexpectedly entered kernel.
INFO: loop times:
  1 cycles (count: 128606844716)
  2 cycles (count: 31558352292)
  3 cycles (count: 4)
  29 cycles (count: 437)
  30 cycles (count: 1874)
  31 cycles (count: 221)
  57 cycles (count: 4)
  58 cycles (count: 6)
  59 cycles (count: 1)

real  15m58.643s
user  15m58.626s
sys   0m0.012s

I pass task_isolation_debug to boot parameters:
# cat /proc/cmdline 
BOOT_IMAGE=/boot/Image-isol nohz_full=100-110 isolcpus=100-110 task_isolation_debug root=UUID=75b9dd5b-58d8-4a50-8868-004cb7c1f25f ro text

But dmesg looks empty...

I investigate it, but at now I have no ideas what happens. Have you seen
that before?

Anyway, we are going to include your test in our scenario, with some
modifications. I've added --dry-run option to make it easier to
demonstrate the effect of isolation on jitter. If you like it, feel
free to use this change.

Tested-by: Yury Norov <ynorov@caviumnetworks.com>

From 5c5823c1fc8441ab1486287679de77b8cea5154d Mon Sep 17 00:00:00 2001
From: Yury Norov <ynorov@caviumnetworks.com>
Date: Wed, 7 Mar 2018 02:41:08 +0300
Subject: [PATCH] isolation test: --dry-run mode

Add dry-run mode for better understanding the effect of isolation.
Also, make sanity checks on waitticks.

Signed-off-by: Yury Norov <ynorov@caviumnetworks.com>
---
 tools/testing/selftests/task_isolation/isolation.c | 47 +++++++++++++++++-----
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/task_isolation/isolation.c b/tools/testing/selftests/task_isolation/isolation.c
index 9c0b49619b40..e90a6c85fe2a 100644
--- a/tools/testing/selftests/task_isolation/isolation.c
+++ b/tools/testing/selftests/task_isolation/isolation.c
@@ -53,6 +53,7 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <assert.h>
 #include <string.h>
 #include <errno.h>
@@ -500,7 +501,7 @@ static void jitter_handler(int sig)
 	exit(exit_status);
 }
 
-static void test_jitter(unsigned long waitticks)
+static void test_jitter(unsigned long waitticks, int flags)
 {
 	u_int64_t start, last, elapsed;
 	int rc;
@@ -513,7 +514,8 @@ static void test_jitter(unsigned long waitticks)
 	rc = mlockall(MCL_CURRENT);
 	assert(rc == 0);
 
-	set_task_isolation(PR_TASK_ISOLATION_ENABLE |
+	if (flags & PR_TASK_ISOLATION_ENABLE)
+		set_task_isolation(PR_TASK_ISOLATION_ENABLE |
 			   PR_TASK_ISOLATION_SET_SIG(SIGUSR1));
 
 	last = start = get_cycle_count();
@@ -537,26 +539,49 @@ static void test_jitter(unsigned long waitticks)
 	} while (elapsed < waitticks);
 
 	jitter_test_complete = true;
-	prctl_isolation(0);
+
+	if (flags & PR_TASK_ISOLATION_ENABLE)
+		prctl_isolation(0);
+
 	jitter_summarize();
 }
 
 int main(int argc, char **argv)
 {
 	/* How many billion ticks to wait after running the other tests? */
-	unsigned long waitticks;
+	long waitticks = 10;
+	int flags = PR_TASK_ISOLATION_ENABLE;
 	char buf[100];
 	char *result, *end;
 	FILE *f;
 
-	if (argc == 1)
-		waitticks = 10;
-	else if (argc == 2)
-		waitticks = strtol(argv[1], NULL, 10);
-	else {
-		printf("syntax: isolation [gigaticks]\n");
+	errno = 0;
+
+	switch (argc) {
+	case 1:
+		break;
+	case 2:
+		if (strcmp(argv[1], "--dry-run") == 0)
+			flags = 0;
+		else
+			waitticks = strtol(argv[1], NULL, 10);
+		break;
+	case 3:
+		if (strcmp(argv[1], "--dry-run") == 0)
+			flags = 0;
+
+		waitticks = strtol(argv[2], NULL, 10);
+		break;
+	default:
+		printf("syntax: isolation [--dry-run] [gigaticks]\n");
 		ksft_exit_fail();
 	}
+
+	if (errno || waitticks <= 0 || waitticks > (LONG_MAX / 1000000000)) {
+		printf("Gigaticks: bad number.\n");
+		ksft_exit_fail();
+	}
+
 	waitticks *= 1000000000;
 
 	/* Get a core from the /sys nohz_full device. */
@@ -637,7 +662,7 @@ int main(int argc, char **argv)
 		return exit_status;
 	}
 
-	test_jitter(waitticks);
+	test_jitter(waitticks, flags);
 
 	return exit_status;
 }
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
