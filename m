Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2D33F9
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from p3plwbeout26-05.prod.phx3.secureserver.net (p3plsmtp26-05-2.prod.phx3.secureserver.net [216.69.139.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF49C0
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 13:33:59 -0700 (PDT)
Received: from mailex.mailcore.me ([94.136.40.142])
	by :WBEOUT: with ESMTP
	id xCTuqFGaNm1kPxCTvqaQRp; Sun, 29 Oct 2023 13:33:59 -0700
X-CMAE-Analysis: v=2.4 cv=bLPTnNyZ c=1 sm=1 tr=0 ts=653ec1b7
 a=s1hRAmXuQnGNrIj+3lWWVA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=AUd_NHdVAAAA:8
 a=FXvPX3liAAAA:8 a=VwQbUJbxAAAA:8 a=vaoKmyfopMuWMe4x9wgA:9 a=QEXdDO2ut3YA:10
 a=UObqyxdv-6Yh2QiB9mM_:22 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: xCTuqFGaNm1kP
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175] helo=[192.168.178.90])
	by smtp12.mailcore.me with esmtpa (Exim 4.94.2)
	(envelope-from <phillip@squashfs.org.uk>)
	id 1qxCTr-0006on-PN; Sun, 29 Oct 2023 20:33:56 +0000
Message-ID: <bd039dc7-cfe5-c210-b65e-0cba3186ee0b@squashfs.org.uk>
Date: Sun, 29 Oct 2023 20:33:54 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] docs: filesystems: document the squashfs specific
 mount options
To: Ariel Miculas <amiculas@cisco.com>, linux-doc@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Cc: serge@hallyn.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org
References: <20231029161924.50648-1-amiculas@cisco.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20231029161924.50648-1-amiculas@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated:  phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfL4x8jLDkzbGkBtVc9zmuJx9uFFd9xvMwlrG/h/PKB8vMyWom8ivbSHcE/5424we7xTRPXYW+UujIFAE7bc5T6WZyTRxMiO1mBtaXwUoNhJ/aGSj5rO9
 7InyJdAB4F0LYSShaZpEK8nVC2W79Pp5bIMHjW0flT96wQ0ls2+45syAo5mUTIAYd31CSegRR8/1zQt0SYNpuGq3Z0DY74f3TLqZlVrSedPGiyMXu6JuDtHM
 dV1OQYkbLdAn+/IBRXNjYg==

On 29/10/2023 16:19, Ariel Miculas wrote:
> When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set, the "threads" mount option
> can be used to specify the decompression mode: single-threaded,
> multi-threaded, percpu or the number of threads used for decompression.
> When SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set and
> SQUASHFS_DECOMP_MULTI is set, the "threads" option can also be used to
> specify the number of threads used for decompression. This mount option
> is only mentioned in fs/squashfs/Kconfig, which makes it difficult to
> find.
> 
> Another mount option available is "errors", which can be configured to
> panic the kernel when squashfs errors are encountered.
> 
> Add both these options to the squashfs documentation, making them more
> noticeable.
> 
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

Looks good to me.

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>

> ---
>   Documentation/filesystems/squashfs.rst | 59 ++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/filesystems/squashfs.rst b/Documentation/filesystems/squashfs.rst
> index df42106bae71..0a7fa66b70f8 100644
> --- a/Documentation/filesystems/squashfs.rst
> +++ b/Documentation/filesystems/squashfs.rst
> @@ -64,6 +64,65 @@ obtained from this site also.
>   The squashfs-tools development tree is now located on kernel.org
>   	git://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools.git
>   
> +2.1 Mount options
> +-----------------
> +===================    =========================================================
> +errors=%s              Specify whether squashfs errors trigger a kernel panic
> +                       or not
> +
> +		       ==========  =============================================
> +                         continue  errors don't trigger a panic (default)
> +                            panic  trigger a panic when errors are encountered,
> +                                   similar to several other filesystems (e.g.
> +                                   btrfs, ext4, f2fs, GFS2, jfs, ntfs, ubifs)
> +
> +                                   This allows a kernel dump to be saved,
> +                                   useful for analyzing and debugging the
> +                                   corruption.
> +                       ==========  =============================================
> +threads=%s             Select the decompression mode or the number of threads
> +
> +                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is set:
> +
> +		       ==========  =============================================
> +                           single  use single-threaded decompression (default)
> +
> +                                   Only one block (data or metadata) can be
> +                                   decompressed at any one time. This limits
> +                                   CPU and memory usage to a minimum, but it
> +                                   also gives poor performance on parallel I/O
> +                                   workloads when using multiple CPU machines
> +                                   due to waiting on decompressor availability.
> +                            multi  use up to two parallel decompressors per core
> +
> +                                   If you have a parallel I/O workload and your
> +                                   system has enough memory, using this option
> +                                   may improve overall I/O performance. It
> +                                   dynamically allocates decompressors on a
> +                                   demand basis.
> +                           percpu  use a maximum of one decompressor per core
> +
> +                                   It uses percpu variables to ensure
> +                                   decompression is load-balanced across the
> +                                   cores.
> +                        1|2|3|...  configure the number of threads used for
> +                                   decompression
> +
> +                                   The upper limit is num_online_cpus() * 2.
> +                       ==========  =============================================
> +
> +                       If SQUASHFS_CHOICE_DECOMP_BY_MOUNT is **not** set and
> +                       SQUASHFS_DECOMP_MULTI is set:
> +
> +		       ==========  =============================================
> +                          2|3|...  configure the number of threads used for
> +                                   decompression
> +
> +                                   The upper limit is num_online_cpus() * 2.
> +                       ==========  =============================================
> +
> +===================    =========================================================
> +
>   3. Squashfs Filesystem Design
>   -----------------------------
>   

