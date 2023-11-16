Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="cEoL1JoV"
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7801AE;
	Thu, 16 Nov 2023 02:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=KOCiWUhMH4hnxHlWOWnGeGYkeEeB5aUu205Zvuz11KU=; b=cEoL1JoVdqwT9mHr0UlV0Sx71j
	IztOapDuFS5+FCzgG760gnCgwl/yKCtjGmGsL4vtPwPMHpSsSlojB7A/lDpIFo7yCE8A1Se0EwV1P
	ZmVLZLGD3iDi3VMnyik5h3bRV2NTqYx8jz2YjhEpx7h6jmAseNVILhkTaUCLVy8boq0g=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:34750 helo=asus64.hugovil.com)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1r3ZgQ-0000qg-UU; Thu, 16 Nov 2023 05:33:15 -0500
Date: Thu, 16 Nov 2023 05:33:14 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: <git@amd.com>, <michal.simek@amd.com>, <jacmet@sunsite.dk>,
 <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <corbet@lwn.net>, <christophe.leroy@csgroup.eu>, <rdunlap@infradead.org>,
 <airlied@redhat.com>, <ogabbay@kernel.org>, <linux-doc@vger.kernel.org>,
 <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
 <shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>
Message-Id: <20231116053314.e976a87476cc5bc20eacde48@hugovil.com>
In-Reply-To: <20231116072915.3338387-2-manikanta.guntupalli@amd.com>
References: <20231116072915.3338387-1-manikanta.guntupalli@amd.com>
	<20231116072915.3338387-2-manikanta.guntupalli@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
Subject: Re: [PATCH V3 1/2] Documentation: devices.txt: Update ttyUL major
 number allocation details
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Thu, 16 Nov 2023 12:59:14 +0530
Manikanta Guntupalli <manikanta.guntupalli@amd.com> wrote:

Hi,

> Describe when uartlite driver uses static/dynamic allocation for major
> number based on maximum number of uartlite serial ports.
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
> Changes for V2:
> This patch introduced in V2.
> Changes for V3:
> Fix typo.
> Move description to above of ttyUL.
> ---
>  Documentation/admin-guide/devices.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
> index 839054923530..ae7431e317ad 100644
> --- a/Documentation/admin-guide/devices.txt
> +++ b/Documentation/admin-guide/devices.txt
> @@ -2704,6 +2704,9 @@
>  		    ...
>  		 185 = /dev/ttyNX15		Hilscher netX serial port 15
>  		 186 = /dev/ttyJ0		JTAG1 DCC protocol based serial port emulation
> +
> +		 If maximum number of uartlite serial ports are more than 4, then driver uses

"are more" -> "is more"

"then driver" -> "the driver" (or "then the driver")

Hugo.


> +		 dynamic allocation instead of static allocation for major number.
>  		 187 = /dev/ttyUL0		Xilinx uartlite - port 0
>  		    ...
>  		 190 = /dev/ttyUL3		Xilinx uartlite - port 3
> -- 
> 2.25.1
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>
